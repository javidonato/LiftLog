import Foundation
import SwiftData

@Model
final class Workout {
    var id: UUID = UUID()
    var name: String = ""
    var startedAt: Date = Date.now
    /// nil = entrenamiento en curso (sobrevive al cierre de la app y puede reanudarse).
    var endedAt: Date?
    var notes: String = ""
    /// Referencia "blanda" al día de rutina de origen. No es relación: si se borra la rutina, el historial queda intacto.
    var routineDayID: UUID?

    @Relationship(deleteRule: .cascade, inverse: \WorkoutExercise.workout)
    var exercises: [WorkoutExercise] = []

    init(name: String, startedAt: Date = .now, routineDayID: UUID? = nil) {
        self.name = name
        self.startedAt = startedAt
        self.routineDayID = routineDayID
    }

    var isInProgress: Bool { endedAt == nil }

    /// Duración real si terminó; tiempo transcurrido si sigue en curso.
    var duration: TimeInterval {
        max(0, (endedAt ?? Date.now).timeIntervalSince(startedAt))
    }

    var sortedExercises: [WorkoutExercise] {
        exercises.sorted { $0.order < $1.order }
    }

    var totalVolumeKg: Double {
        exercises.reduce(0) { $0 + $1.volumeKg }
    }

    func finish(at date: Date = .now) {
        endedAt = date
    }
}
