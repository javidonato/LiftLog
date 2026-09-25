import Foundation
import SwiftData

@Model
final class WorkoutSet {
    var id: UUID = UUID()
    var number: Int = 1
    /// Siempre en kilogramos. Ver `WeightUnit`.
    var weightKg: Double = 0
    var reps: Int = 0
    var rir: Int?
    var rpe: Double?
    var typeRaw: String = SetType.normal.rawValue
    /// true cuando el usuario confirma la serie. Solo las series completadas cuentan en volumen y PRs.
    var isCompleted: Bool = false
    var date: Date = Date.now

    var workoutExercise: WorkoutExercise?

    init(
        number: Int,
        weightKg: Double = 0,
        reps: Int = 0,
        type: SetType = .normal,
        isCompleted: Bool = false,
        date: Date = .now
    ) {
        self.number = number
        self.weightKg = weightKg
        self.reps = reps
        self.typeRaw = type.rawValue
        self.isCompleted = isCompleted
        self.date = date
    }

    var type: SetType {
        get { SetType(rawValue: typeRaw) ?? .normal }
        set { typeRaw = newValue.rawValue }
    }

    /// Decisión de producto: el calentamiento y las series sin completar NO suman volumen ni PRs.
    var countsTowardStats: Bool {
        isCompleted && type != .warmup
    }

    var volumeKg: Double {
        countsTowardStats ? TrainingMath.volume(weightKg: weightKg, reps: reps) : 0
    }

    var estimatedOneRepMaxKg: Double {
        countsTowardStats ? TrainingMath.estimatedOneRepMax(weightKg: weightKg, reps: reps) : 0
    }
}
