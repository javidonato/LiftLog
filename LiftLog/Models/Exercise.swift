import Foundation
import SwiftData

@Model
final class Exercise {
    var id: UUID = UUID()
    var name: String = ""
    var muscleGroupRaw: String = MuscleGroup.chest.rawValue
    var equipmentRaw: String = Equipment.other.rawValue
    var details: String = ""
    /// true = creado por el usuario; false = viene del catálogo inicial.
    var isCustom: Bool = false
    /// Los ejercicios con historial NO se borran: se archivan (así no se rompen entrenamientos pasados).
    var isArchived: Bool = false
    /// Clave estable del catálogo inicial (nil si es personalizado). Permite ampliar el catálogo sin duplicar.
    var seedKey: String?
    var createdAt: Date = Date.now

    @Relationship(deleteRule: .nullify, inverse: \WorkoutExercise.exercise)
    var workoutEntries: [WorkoutExercise] = []

    @Relationship(deleteRule: .nullify, inverse: \RoutineExercise.exercise)
    var routineEntries: [RoutineExercise] = []

    init(
        name: String,
        muscleGroup: MuscleGroup,
        equipment: Equipment,
        details: String = "",
        isCustom: Bool = false,
        seedKey: String? = nil
    ) {
        self.name = name
        self.muscleGroupRaw = muscleGroup.rawValue
        self.equipmentRaw = equipment.rawValue
        self.details = details
        self.isCustom = isCustom
        self.seedKey = seedKey
    }

    var muscleGroup: MuscleGroup {
        get { MuscleGroup(rawValue: muscleGroupRaw) ?? .chest }
        set { muscleGroupRaw = newValue.rawValue }
    }

    var equipment: Equipment {
        get { Equipment(rawValue: equipmentRaw) ?? .other }
        set { equipmentRaw = newValue.rawValue }
    }
}
