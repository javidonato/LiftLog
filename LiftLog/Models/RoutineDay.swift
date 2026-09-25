import Foundation
import SwiftData

@Model
final class RoutineDay {
    var id: UUID = UUID()
    var name: String = ""
    var order: Int = 0

    var routine: Routine?

    @Relationship(deleteRule: .cascade, inverse: \RoutineExercise.day)
    var exercises: [RoutineExercise] = []

    init(name: String, order: Int) {
        self.name = name
        self.order = order
    }

    var sortedExercises: [RoutineExercise] {
        exercises.sorted { $0.order < $1.order }
    }

    /// "Pecho · Espalda · Bíceps" — grupos musculares sin repetir, en orden.
    var muscleSummary: String {
        var seen: [MuscleGroup] = []
        for entry in sortedExercises {
            if let group = entry.exercise?.muscleGroup, !seen.contains(group) {
                seen.append(group)
            }
        }
        return seen.map(\.displayName).joined(separator: " · ")
    }
}
