import XCTest
import SwiftData
@testable import LiftLog

// MARK: - Conversión de unidades

final class WeightUnitTests: XCTestCase {
    func testKilogramsToPounds() {
        XCTAssertEqual(WeightUnit.lb.fromKilograms(100), 220.462, accuracy: 0.001)
    }

    func testPoundsToKilograms() {
        XCTAssertEqual(WeightUnit.lb.toKilograms(55), 24.9476, accuracy: 0.001)
    }

    func testRoundTripPreservesValue() {
        let kg = WeightUnit.lb.toKilograms(135)
        XCTAssertEqual(WeightUnit.lb.fromKilograms(kg), 135, accuracy: 0.0001)
    }

    func testKilogramsAreIdentity() {
        XCTAssertEqual(WeightUnit.kg.fromKilograms(62.5), 62.5)
        XCTAssertEqual(WeightUnit.kg.toKilograms(62.5), 62.5)
    }
}

// MARK: - Fórmulas

final class TrainingMathTests: XCTestCase {
    func testVolume() {
        XCTAssertEqual(TrainingMath.volume(weightKg: 55, reps: 8), 440)
    }

    func testVolumeIgnoresInvalidInput() {
        XCTAssertEqual(TrainingMath.volume(weightKg: 0, reps: 10), 0)
        XCTAssertEqual(TrainingMath.volume(weightKg: 50, reps: 0), 0)
    }

    func testEpleyOneRepMax() {
        XCTAssertEqual(TrainingMath.estimatedOneRepMax(weightKg: 100, reps: 5), 116.6667, accuracy: 0.001)
    }

    func testOneRepMaxWithSingleRepIsTheWeight() {
        XCTAssertEqual(TrainingMath.estimatedOneRepMax(weightKg: 100, reps: 1), 100)
    }

    func testDurationFormatting() {
        XCTAssertEqual(TimeInterval(3840).workoutDurationText, "1h 04m")
        XCTAssertEqual(TimeInterval(58 * 60).workoutDurationText, "58 min")
    }
}

// MARK: - Modelos SwiftData

@MainActor
final class WorkoutModelTests: XCTestCase {
    private var container: ModelContainer!
    private var context: ModelContext { container.mainContext }

    override func setUpWithError() throws {
        container = try AppSchema.makeContainer(inMemory: true)
    }

    override func tearDown() {
        container = nil
    }

    private typealias SetSpec = (kg: Double, reps: Int, type: SetType, done: Bool)

    @discardableResult
    private func makeWorkout(_ specs: [SetSpec], exercise: Exercise? = nil) -> Workout {
        let workout = Workout(name: "Test")
        context.insert(workout)
        let entry = WorkoutExercise(order: 0)
        context.insert(entry)
        entry.workout = workout
        entry.exercise = exercise
        for (index, spec) in specs.enumerated() {
            let set = WorkoutSet(number: index + 1, weightKg: spec.kg, reps: spec.reps,
                                 type: spec.type, isCompleted: spec.done)
            context.insert(set)
            set.workoutExercise = entry
        }
        return workout
    }

    func testWorkoutVolumeSumsCompletedSets() {
        // 55×8 + 55×8 + 50×10 = 440 + 440 + 500 = 1380
        let workout = makeWorkout([
            (55, 8, .normal, true), (55, 8, .normal, true), (50, 10, .normal, true)
        ])
        XCTAssertEqual(workout.totalVolumeKg, 1380)
    }

    func testWarmupAndIncompleteSetsDoNotCountTowardVolume() {
        let workout = makeWorkout([
            (20, 10, .warmup, true),   // calentamiento: no cuenta
            (50, 5, .normal, true),    // 250
            (50, 5, .normal, false)    // sin completar: no cuenta
        ])
        XCTAssertEqual(workout.totalVolumeKg, 250)
    }

    func testDurationUsesStartAndEnd() {
        let start = Date(timeIntervalSince1970: 1_000_000)
        let workout = Workout(name: "Duración", startedAt: start)
        XCTAssertTrue(workout.isInProgress)
        workout.finish(at: start.addingTimeInterval(3840))
        XCTAssertFalse(workout.isInProgress)
        XCTAssertEqual(workout.duration, 3840)
        XCTAssertEqual(workout.duration.workoutDurationText, "1h 04m")
    }

    func testDeletingWorkoutCascadesToEntriesAndSetsButKeepsExercise() throws {
        let exercise = Exercise(name: "Press banca", muscleGroup: .chest, equipment: .barbell)
        context.insert(exercise)
        let workout = makeWorkout([(55, 8, .normal, true), (55, 8, .normal, true)], exercise: exercise)
        try context.save()

        context.delete(workout)
        try context.save()

        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Workout>()), 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<WorkoutExercise>()), 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<WorkoutSet>()), 0)
        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Exercise>()), 1)
    }

    func testRoutineDayMuscleSummary() throws {
        let bench = Exercise(name: "Press banca", muscleGroup: .chest, equipment: .barbell)
        let row = Exercise(name: "Remo con barra", muscleGroup: .back, equipment: .barbell)
        let fly = Exercise(name: "Aperturas", muscleGroup: .chest, equipment: .dumbbell)
        [bench, row, fly].forEach { context.insert($0) }

        let routine = Routine(name: "Test"); context.insert(routine)
        let day = RoutineDay(name: "Torso", order: 0); context.insert(day)
        day.routine = routine
        for (index, exercise) in [bench, row, fly].enumerated() {
            let entry = RoutineExercise(order: index); context.insert(entry)
            entry.day = day
            entry.exercise = exercise
        }
        XCTAssertEqual(day.muscleSummary, "Pecho · Espalda")
    }

    func testSeederIsIdempotentAndCatalogKeysAreUnique() throws {
        let keys = ExerciseCatalog.entries.map(\.key)
        XCTAssertEqual(Set(keys).count, keys.count, "Hay claves duplicadas en el catálogo")

        ExerciseSeeder.seedIfNeeded(in: context)
        ExerciseSeeder.seedIfNeeded(in: context)

        XCTAssertEqual(try context.fetchCount(FetchDescriptor<Exercise>()), ExerciseCatalog.entries.count)
    }
}
