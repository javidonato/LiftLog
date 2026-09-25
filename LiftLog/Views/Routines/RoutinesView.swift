import SwiftUI

struct RoutinesView: View {
    var body: some View {
        NavigationStack {
            PhasePlaceholderView(
                symbol: "list.bullet.rectangle",
                title: "Rutinas",
                message: "Crea rutinas, días y ejercicios.",
                phase: 3
            )
            .navigationTitle("Rutinas")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    RoutinesView()
}
