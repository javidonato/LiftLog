import SwiftUI
import SwiftData

struct RegisterView: View {
    @Query(filter: #Predicate<Exercise> { $0.isArchived == false })
    private var exercises: [Exercise]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                PhasePlaceholderView(
                    symbol: "dumbbell",
                    title: "Aquí registrarás tus entrenamientos",
                    message: "Rutina del día, sesión libre y últimas sesiones.",
                    phase: 2
                )
                // Verificación de Fase 1: confirma que SwiftData y el catálogo inicial funcionan.
                Text("Biblioteca cargada: \(exercises.count) ejercicios")
                    .font(.footnote)
                    .foregroundStyle(Theme.inkSecondary)
                    .padding(.bottom, Theme.Spacing.l)
                    .frame(maxWidth: .infinity)
                    .background(Theme.background)
            }
            .navigationTitle("Registrar")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    RegisterView().modelContainer(AppSchema.preview)
}
