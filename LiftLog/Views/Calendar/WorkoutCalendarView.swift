import SwiftUI

struct WorkoutCalendarView: View {
    var body: some View {
        NavigationStack {
            PhasePlaceholderView(
                symbol: "calendar",
                title: "Calendario",
                message: "Los días que entrenaste, con su detalle.",
                phase: 5
            )
            .navigationTitle("Calendario")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    WorkoutCalendarView()
}
