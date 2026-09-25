import SwiftUI

/// TEMPORAL: se muestra solo en pantallas cuya funcionalidad aún no está implementada.
/// Desaparece a medida que se completan las fases.
struct PhasePlaceholderView: View {
    let symbol: String
    let title: String
    let message: String
    let phase: Int

    var body: some View {
        VStack(spacing: Theme.Spacing.m) {
            Image(systemName: symbol)
                .font(.system(size: 40, weight: .light))
                .foregroundStyle(Theme.accent)
                .accessibilityHidden(true)
            Text(title)
                .font(.title3.weight(.semibold))
                .foregroundStyle(Theme.ink)
                .multilineTextAlignment(.center)
            Text(message)
                .font(.subheadline)
                .foregroundStyle(Theme.inkSecondary)
                .multilineTextAlignment(.center)
            Text("Se implementa en la Fase \(phase)")
                .font(.caption.weight(.semibold))
                .padding(.horizontal, Theme.Spacing.m)
                .padding(.vertical, Theme.Spacing.xs)
                .background(Theme.hairline.opacity(0.6), in: Capsule())
                .foregroundStyle(Theme.inkSecondary)
        }
        .padding(Theme.Spacing.xl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.background)
    }
}
