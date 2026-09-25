import SwiftUI

extension UIColor {
    convenience init(hex: UInt32) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255,
            green: CGFloat((hex >> 8) & 0xFF) / 255,
            blue: CGFloat(hex & 0xFF) / 255,
            alpha: 1
        )
    }
}

extension Color {
    /// Color que cambia automáticamente entre Light y Dark Mode (sin necesitar Asset Catalog).
    init(light: UInt32, dark: UInt32) {
        self.init(uiColor: UIColor { traits in
            UIColor(hex: traits.userInterfaceStyle == .dark ? dark : light)
        })
    }
}

extension Double {
    /// Hasta 1 decimal, sin ceros sobrantes: 55 -> "55", 62.5 -> "62,5" (según región).
    var trimmedString: String {
        formatted(.number.precision(.fractionLength(0...1)))
    }
}

extension TimeInterval {
    /// 3840 s -> "1h 04m"; 58 min -> "58 min".
    var workoutDurationText: String {
        let totalMinutes = Int(self / 60)
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60
        if hours > 0 {
            return String(format: "%dh %02dm", hours, minutes)
        }
        return "\(minutes) min"
    }
}
