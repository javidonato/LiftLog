import SwiftUI

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(Theme.Spacing.l)
            .background(
                Theme.surface,
                in: RoundedRectangle(cornerRadius: Theme.Radius.card, style: .continuous)
            )
            .overlay(
                RoundedRectangle(cornerRadius: Theme.Radius.card, style: .continuous)
                    .strokeBorder(Theme.hairline, lineWidth: 1)
            )
    }
}

extension View {
    /// Tarjeta redondeada con borde fino. Base de WorkoutCard, MetricCard, etc.
    func cardStyle() -> some View { modifier(CardStyle()) }
}
