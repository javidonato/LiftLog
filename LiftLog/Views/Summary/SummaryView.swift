import SwiftUI

struct SummaryView: View {
    var body: some View {
        NavigationStack {
            PhasePlaceholderView(
                symbol: "chart.bar.xaxis",
                title: "Resumen",
                message: "Estadísticas de la semana y ajustes.",
                phase: 6
            )
            .navigationTitle("Resumen")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    SummaryView()
}
