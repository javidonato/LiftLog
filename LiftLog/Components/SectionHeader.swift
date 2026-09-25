import SwiftUI

/// Encabezado de sección en mayúsculas ("ÚLTIMAS SESIONES").
struct SectionHeader: View {
    let title: String

    var body: some View {
        Text(title.uppercased())
            .font(.footnote.weight(.semibold))
            .tracking(1.2)
            .foregroundStyle(Theme.inkSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityAddTraits(.isHeader)
    }
}

#Preview {
    SectionHeader(title: "Últimas sesiones").padding()
}
