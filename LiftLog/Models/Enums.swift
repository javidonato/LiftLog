import Foundation

/// Los raw values son estables (en inglés) porque se guardan en la base de datos.
/// El texto en español (`displayName`) puede cambiar sin migrar datos.

enum MuscleGroup: String, CaseIterable, Codable, Identifiable {
    case chest, back, biceps, triceps, shoulders, quadriceps, hamstrings, glutes, calves, core

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .chest: return "Pecho"
        case .back: return "Espalda"
        case .biceps: return "Bíceps"
        case .triceps: return "Tríceps"
        case .shoulders: return "Hombros"
        case .quadriceps: return "Cuádriceps"
        case .hamstrings: return "Femoral"
        case .glutes: return "Glúteos"
        case .calves: return "Pantorrillas"
        case .core: return "Core"
        }
    }
}

enum Equipment: String, CaseIterable, Codable, Identifiable {
    case barbell, dumbbell, machine, cable, bodyweight, smith, other

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .barbell: return "Barra"
        case .dumbbell: return "Mancuernas"
        case .machine: return "Máquina"
        case .cable: return "Cable"
        case .bodyweight: return "Peso corporal"
        case .smith: return "Smith"
        case .other: return "Otro"
        }
    }
}

enum SetType: String, CaseIterable, Codable, Identifiable {
    case normal, warmup, dropset, failure

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .normal: return "Normal"
        case .warmup: return "Calentamiento"
        case .dropset: return "Dropset"
        case .failure: return "Fallo"
        }
    }

    /// Etiqueta corta para la fila de la serie.
    var shortLabel: String {
        switch self {
        case .normal: return ""
        case .warmup: return "C"
        case .dropset: return "D"
        case .failure: return "F"
        }
    }
}
