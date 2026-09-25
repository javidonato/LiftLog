import SwiftUI
import SwiftData

struct RootView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        MainTabView()
            .onAppear {
                ExerciseSeeder.seedIfNeeded(in: modelContext)
            }
    }
}

#Preview {
    RootView().modelContainer(AppSchema.preview)
}
