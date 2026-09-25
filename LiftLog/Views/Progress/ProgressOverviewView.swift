import SwiftUI

struct ProgressOverviewView: View {
    var body: some View {
        NavigationStack {
            PhasePlaceholderView(
                symbol: "chart.line.uptrend.xyaxis",
                title: "Progreso",
                message: "Gráficos por ejercicio, récords y 1RM estimado.",
                phase: 4
            )
            .navigationTitle("Progreso")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ProgressOverviewView()
}
