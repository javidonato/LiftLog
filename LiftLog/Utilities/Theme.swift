import SwiftUI

/// Sistema de diseño: paleta neutra cálida con un único acento terracota.
/// Todos los colores tienen variante clara y oscura.
enum Theme {
    // Colores
    static let background = Color(light: 0xF2EEE6, dark: 0x121110)
    static let surface    = Color(light: 0xFBF9F5, dark: 0x1C1B19)
    static let ink        = Color(light: 0x1A1917, dark: 0xF4F1EA)
    static let inkSecondary = Color(light: 0x6B675F, dark: 0xA7A296)
    static let hairline   = Color(light: 0xD9D3C7, dark: 0x33312D)
    static let accent     = Color(light: 0xB4532A, dark: 0xE58657)

    enum Spacing {
        static let xs: CGFloat = 4
        static let s: CGFloat = 8
        static let m: CGFloat = 12
        static let l: CGFloat = 16
        static let xl: CGFloat = 24
        static let xxl: CGFloat = 32
    }

    enum Radius {
        static let card: CGFloat = 20
        static let control: CGFloat = 14
    }
}
