import Foundation
import SwiftData

@Model
final class Routine {
    var id: UUID = UUID()
    var name: String = ""
    var details: String = ""
    var createdAt: Date = Date.now

    @Relationship(deleteRule: .cascade, inverse: \RoutineDay.routine)
    var days: [RoutineDay] = []

    init(name: String, details: String = "") {
        self.name = name
        self.details = details
    }

    var sortedDays: [RoutineDay] {
        days.sorted { $0.order < $1.order }
    }
}
