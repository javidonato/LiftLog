import SwiftData

enum AppSchema {
    static let models: [any PersistentModel.Type] = [
        Exercise.self,
        Workout.self,
        WorkoutExercise.self,
        WorkoutSet.self,
        Routine.self,
        RoutineDay.self,
        RoutineExercise.self
    ]

    static func makeContainer(inMemory: Bool = false) throws -> ModelContainer {
        let schema = Schema(models)
        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: inMemory,
            cloudKitDatabase: .none
        )

        return try ModelContainer(
            for: schema,
            configurations: [configuration]
        )
    }

    /// Contenedor en memoria utilizado por la aplicación para previews y tests.
    static var preview: ModelContainer {
        try! makeContainer(inMemory: true)
    }
}
