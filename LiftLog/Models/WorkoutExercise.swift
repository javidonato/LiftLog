import Foundation
import SwiftData

/// Un ejercicio dentro de un entrenamiento concreto.
@Model
final class WorkoutExercise {
    var id: UUID = UUID()
    var order: Int = 0
    var notes: String = ""
    /// Copia de la fecha del entrenamiento. Desnormalización intencional: permite consultar
    /// "última vez que hice este ejercicio" con un solo FetchDescriptor ordenado, sin joins.
    var performedAt: Date = Date.now

    var exercise: Exercise?
    var workout: Workout?

    @Relationship(deleteRule: .cascade, inverse: \WorkoutSet.workoutExercise)
    var sets: [WorkoutSet] = []

    /// IMPORTANTE: primero `context.insert(...)`, después asignar relaciones.
    init(order: Int, performedAt: Date = .now) {
        self.order = order
        self.performedAt = performedAt
    }

    var sortedSets: [WorkoutSet] {
        sets.sorted { $0.number < $1.number }
    }

    var volumeKg: Double {
        sets.reduce(0) { $0 + $1.volumeKg }
    }
}
