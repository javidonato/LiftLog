import SwiftUI
import SwiftData

@main
struct LiftLogApp: App {
    @AppStorage(SettingsKey.appearance) private var appearanceRaw = AppAppearance.system.rawValue

    private let container: ModelContainer = {
        do {
            return try AppSchema.makeContainer()
        } catch {
            fatalError("No se pudo abrir la base de datos: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(AppAppearance(rawValue: appearanceRaw)?.colorScheme)
        }
        .modelContainer(container)
    }
}
