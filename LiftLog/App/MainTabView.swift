import SwiftUI

enum AppTab: String, CaseIterable, Identifiable {
    case register, routines, progress, calendar, summary

    var id: String { rawValue }

    var title: String {
        switch self {
        case .register: return "Registrar"
        case .routines: return "Rutinas"
        case .progress: return "Progreso"
        case .calendar: return "Calendario"
        case .summary: return "Resumen"
        }
    }

    var symbol: String {
        switch self {
        case .register: return "dumbbell.fill"
        case .routines: return "list.bullet.rectangle"
        case .progress: return "chart.line.uptrend.xyaxis"
        case .calendar: return "calendar"
        case .summary: return "chart.bar.xaxis"
        }
    }

    @ViewBuilder
    var rootView: some View {
        switch self {
        case .register: RegisterView()
        case .routines: RoutinesView()
        case .progress: ProgressOverviewView()
        case .calendar: WorkoutCalendarView()
        case .summary: SummaryView()
        }
    }
}

struct MainTabView: View {
    @State private var selection: AppTab = .register

    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppTab.allCases) { tab in
                tab.rootView
                    .tabItem { Label(tab.title, systemImage: tab.symbol) }
                    .tag(tab)
            }
        }
        .tint(Theme.accent)
    }
}

#Preview {
    MainTabView().modelContainer(AppSchema.preview)
}
