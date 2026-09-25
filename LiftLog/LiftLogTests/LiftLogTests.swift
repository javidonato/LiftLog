import XCTest
import SwiftData
@testable import LiftLog

final class LiftLogTests: XCTestCase {
    func testAppSchemaCreatesInMemoryContainer() throws {
        let container = try AppSchema.makeContainer(inMemory: true)
        XCTAssertNotNil(container)
    }

    func testExerciseCanBeCreated() {
        let exercise = Exercise(
            name: "Test Exercise",
            muscleGroup: .chest,
            equipment: .other
        )

        XCTAssertEqual(exercise.name, "Test Exercise")
        XCTAssertFalse(exercise.isCustom)
        XCTAssertFalse(exercise.isArchived)
    }
}
