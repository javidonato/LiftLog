import Foundation

/// Fórmulas puras de entrenamiento (sin SwiftData) para que sean fáciles de probar.
enum TrainingMath {

    /// volumen = peso × repeticiones
    static func volume(weightKg: Double, reps: Int) -> Double {
        guard weightKg > 0, reps > 0 else { return 0 }
        return weightKg * Double(reps)
    }

    /// 1RM estimado con Epley: peso × (1 + reps / 30).
    /// Es una ESTIMACIÓN, no una medición. Con 1 repetición devuelve el peso tal cual.
    static func estimatedOneRepMax(weightKg: Double, reps: Int) -> Double {
        guard weightKg > 0, reps > 0 else { return 0 }
        if reps == 1 { return weightKg }
        return weightKg * (1 + Double(reps) / 30)
    }
}
