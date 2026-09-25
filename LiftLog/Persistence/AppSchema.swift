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
            // Explícito: hoy es 100 % local. Para iCloud más adelante se cambia aquí.
            cloudKitDatabase: .none
        )
        return try ModelContainer(for: schema, configurations: [configuration])
    }
}

#if DEBUG
extension AppSchema {
    /// Contenedor en memoria para previews de Xcode.
    static var preview: ModelContainer {
        try! makeContainer(inMemory: true)
    }
}
#endif
