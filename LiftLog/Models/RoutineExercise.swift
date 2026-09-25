import Foundation
import SwiftData

/// Un ejercicio planificado dentro de un día de rutina (modelo intermedio necesario
/// para poder ordenar y guardar series objetivo por ejercicio).
@Model
final class RoutineExercise {
    var id: UUID = UUID()
    var order: Int = 0
    var targetSets: Int = 3

    var day: RoutineDay?
    var exercise: Exercise?

    init(order: Int, targetSets: Int = 3) {
        self.order = order
        self.targetSets = targetSets
    }
}
