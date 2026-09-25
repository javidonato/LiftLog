import SwiftUI

/// Claves de UserDefaults / @AppStorage. Un solo lugar para evitar strings sueltos.
enum SettingsKey {
    static let weightUnit = "settings.weightUnit"
    static let defaultRestSeconds = "settings.defaultRestSeconds"
    static let appearance = "settings.appearance"
    static let confirmDestructiveActions = "settings.confirmDestructiveActions"
}

enum AppDefaults {
    static let weightUnit: WeightUnit = .kg
    static let restSeconds = 90
    static let restPresets = [30, 60, 90, 120, 180]
}

enum AppAppearance: String, CaseIterable, Identifiable {
    case system, light, dark

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .system: return "Automático"
        case .light: return "Claro"
        case .dark: return "Oscuro"
        }
    }

    /// nil = seguir el ajuste del sistema.
    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}
