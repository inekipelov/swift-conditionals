import XCTest
@testable import Conditionals
@testable import ConditionalsSwiftUI

final class ConditionalsTests: XCTestCase {
    func testCaseIsTrueWithAlwaysTrueCondition() {
        XCTAssertTrue(ConditionKey<AlwaysTrue>().isTrue)
    }

    func testCaseIsTrueWithAlwaysFalseCondition() {
        XCTAssertFalse(ConditionKey<AlwaysFalse>().isTrue)
    }

    func testNotAlwaysTrueIsFalse() {
        XCTAssertFalse(ConditionKey<Not<AlwaysTrue>>().isTrue)
    }

    func testNotAlwaysFalseIsTrue() {
        XCTAssertTrue(ConditionKey<Not<AlwaysFalse>>().isTrue)
    }

    func testAnyOfAlwaysFalseAndAlwaysTrueIsTrue() {
        XCTAssertTrue(ConditionKey<AnyOf<AlwaysFalse, AlwaysTrue>>().isTrue)
    }

    func testAnyOfAlwaysFalseAndAlwaysFalseIsFalse() {
        XCTAssertFalse(ConditionKey<AnyOf<AlwaysFalse, AlwaysFalse>>().isTrue)
    }

    func testAllOfAlwaysTrueAndAlwaysTrueIsTrue() {
        XCTAssertTrue(ConditionKey<AllOf<AlwaysTrue, AlwaysTrue>>().isTrue)
    }

    func testAllOfAlwaysTrueAndAlwaysFalseIsFalse() {
        XCTAssertFalse(ConditionKey<AllOf<AlwaysTrue, AlwaysFalse>>().isTrue)
    }

    func testConditionalValueSelectsThenBranchForTrueCondition() {
        let value = Int.value(ConditionKey<AlwaysTrue>(), 1, else: 2)
        XCTAssertEqual(value, 1)
    }

    func testConditionalValueSelectsElseBranchForFalseCondition() {
        let value = Int.value(ConditionKey<AlwaysFalse>(), 1, else: 2)
        XCTAssertEqual(value, 2)
    }

    func testWWDC25AliasExists() {
        let alias: ConditionKey<WWDC25> = .wwdc25
        XCTAssertNotNil(Optional(alias))
    }

    private struct AlwaysTrue: Condition {
        static func perform<Value>(then: () -> Value, else: () -> Value) -> Value {
            then()
        }
    }

    private struct AlwaysFalse: Condition {
        static func perform<Value>(then: () -> Value, else: () -> Value) -> Value {
            `else`()
        }
    }
}
