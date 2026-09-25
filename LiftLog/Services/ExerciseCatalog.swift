import Foundation

/// Catálogo inicial. Para ampliarlo: agrega una línea con una `key` NUEVA y única.
/// Nunca cambies la `key` de un ejercicio existente.
struct SeedExercise {
    let key: String
    let name: String
    let muscle: MuscleGroup
    let equipment: Equipment
}

enum ExerciseCatalog {
    static let entries: [SeedExercise] = [
        // Pecho
        .init(key: "chest.bench_press", name: "Press banca", muscle: .chest, equipment: .barbell),
        .init(key: "chest.incline_press", name: "Press inclinado", muscle: .chest, equipment: .barbell),
        .init(key: "chest.decline_press", name: "Press declinado", muscle: .chest, equipment: .barbell),
        .init(key: "chest.db_bench_press", name: "Press banca con mancuernas", muscle: .chest, equipment: .dumbbell),
        .init(key: "chest.fly", name: "Aperturas", muscle: .chest, equipment: .dumbbell),
        .init(key: "chest.cable_fly", name: "Cruces en polea", muscle: .chest, equipment: .cable),
        .init(key: "chest.dips", name: "Fondos", muscle: .chest, equipment: .bodyweight),
        .init(key: "chest.pushup", name: "Flexiones", muscle: .chest, equipment: .bodyweight),
        // Espalda
        .init(key: "back.pullup", name: "Dominadas", muscle: .back, equipment: .bodyweight),
        .init(key: "back.chinup", name: "Chin-ups", muscle: .back, equipment: .bodyweight),
        .init(key: "back.lat_pulldown", name: "Jalón al pecho", muscle: .back, equipment: .cable),
        .init(key: "back.barbell_row", name: "Remo con barra", muscle: .back, equipment: .barbell),
        .init(key: "back.seated_row", name: "Remo sentado", muscle: .back, equipment: .cable),
        .init(key: "back.db_row", name: "Remo con mancuerna", muscle: .back, equipment: .dumbbell),
        .init(key: "back.deadlift", name: "Peso muerto", muscle: .back, equipment: .barbell),
        // Hombros
        .init(key: "shoulders.overhead_press", name: "Press militar", muscle: .shoulders, equipment: .barbell),
        .init(key: "shoulders.db_press", name: "Press de hombros con mancuernas", muscle: .shoulders, equipment: .dumbbell),
        .init(key: "shoulders.lateral_raise", name: "Elevaciones laterales", muscle: .shoulders, equipment: .dumbbell),
        .init(key: "shoulders.face_pull", name: "Face pulls", muscle: .shoulders, equipment: .cable),
        .init(key: "shoulders.reverse_fly", name: "Reverse fly", muscle: .shoulders, equipment: .dumbbell),
        // Bíceps
        .init(key: "biceps.barbell_curl", name: "Curl con barra", muscle: .biceps, equipment: .barbell),
        .init(key: "biceps.incline_curl", name: "Curl inclinado", muscle: .biceps, equipment: .dumbbell),
        .init(key: "biceps.hammer_curl", name: "Curl martillo", muscle: .biceps, equipment: .dumbbell),
        .init(key: "biceps.bayesian_curl", name: "Bayesian curl", muscle: .biceps, equipment: .cable),
        .init(key: "biceps.preacher_curl", name: "Preacher curl", muscle: .biceps, equipment: .machine),
        // Tríceps
        .init(key: "triceps.pushdown", name: "Pushdown", muscle: .triceps, equipment: .cable),
        .init(key: "triceps.overhead_extension", name: "Extensión por encima de la cabeza", muscle: .triceps, equipment: .cable),
        .init(key: "triceps.close_grip_bench", name: "Press cerrado", muscle: .triceps, equipment: .barbell),
        .init(key: "triceps.skull_crusher", name: "Rompecráneos", muscle: .triceps, equipment: .barbell),
        // Piernas
        .init(key: "quads.squat", name: "Sentadilla", muscle: .quadriceps, equipment: .barbell),
        .init(key: "quads.hack_squat", name: "Hack squat", muscle: .quadriceps, equipment: .machine),
        .init(key: "quads.leg_press", name: "Leg press", muscle: .quadriceps, equipment: .machine),
        .init(key: "quads.leg_extension", name: "Leg extension", muscle: .quadriceps, equipment: .machine),
        .init(key: "hamstrings.leg_curl", name: "Leg curl", muscle: .hamstrings, equipment: .machine),
        .init(key: "hamstrings.rdl", name: "Peso muerto rumano", muscle: .hamstrings, equipment: .barbell),
        .init(key: "glutes.hip_thrust", name: "Hip thrust", muscle: .glutes, equipment: .barbell),
        .init(key: "calves.calf_raise", name: "Calf raise", muscle: .calves, equipment: .machine),
        // Core
        .init(key: "core.cable_crunch", name: "Crunch en polea", muscle: .core, equipment: .cable),
        .init(key: "core.plank", name: "Plancha", muscle: .core, equipment: .bodyweight),
        .init(key: "core.leg_raise", name: "Elevación de piernas", muscle: .core, equipment: .bodyweight)
    ]
}
