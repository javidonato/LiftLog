import Foundation

/// Unidad de peso preferida del usuario.
/// REGLA: internamente TODO se guarda en kilogramos (`weightKg`).
/// La conversión ocurre únicamente al mostrar o al leer lo que el usuario escribe.
enum WeightUnit: String, CaseIterable, Identifiable {
    case kg
    case lb

    var id: String { rawValue }
    var symbol: String { rawValue }

    var displayName: String {
        switch self {
        case .kg: return "Kilogramos"
        case .lb: return "Libras"
        }
    }

    static let kilogramsPerPound = 0.45359237

    /// Kilogramos almacenados -> valor en esta unidad.
    func fromKilograms(_ kilograms: Double) -> Double {
        switch self {
        case .kg: return kilograms
        case .lb: return kilograms / Self.kilogramsPerPound
        }
    }

    /// Valor escrito por el usuario en esta unidad -> kilogramos para almacenar.
    func toKilograms(_ value: Double) -> Double {
        switch self {
        case .kg: return value
        case .lb: return value * Self.kilogramsPerPound
        }
    }

    /// "55 lb", "62,5 kg" (respeta el idioma/región del dispositivo).
    func format(kilograms: Double, includeUnit: Bool = true) -> String {
        let number = fromKilograms(kilograms).trimmedString
        return includeUnit ? "\(number) \(symbol)" : number
    }
}
