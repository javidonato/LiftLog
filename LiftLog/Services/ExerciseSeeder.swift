import Foundation
import SwiftData

/// Inserta los ejercicios del catálogo que aún no existan. Es idempotente:
/// se puede llamar en cada arranque y solo agrega lo que falta (por `seedKey`).
enum ExerciseSeeder {
    static func seedIfNeeded(in context: ModelContext) {
        do {
            let existing = try context.fetch(FetchDescriptor<Exercise>())
            let existingKeys = Set(existing.compactMap(\.seedKey))
            let missing = ExerciseCatalog.entries.filter { !existingKeys.contains($0.key) }
            guard !missing.isEmpty else { return }

            for entry in missing {
                context.insert(
                    Exercise(
                        name: entry.name,
                        muscleGroup: entry.muscle,
                        equipment: entry.equipment,
                        isCustom: false,
                        seedKey: entry.key
                    )
                )
            }
            try context.save()
        } catch {
            assertionFailure("No se pudo cargar el catálogo inicial: \(error)")
        }
    }
}
