import XCTest
@testable import Conditionals
@testable import ConditionalsSwiftUI

final class ConditionalsTests: XCTestCase {
    func testCaseIsTrueWithAlwaysTrueCondition() {
        XCTAssertTrue(Case<AlwaysTrue>().isTrue)
    }

    func testCaseIsTrueWithAlwaysFalseCondition() {
        XCTAssertFalse(Case<AlwaysFalse>().isTrue)
    }

    func testNotAlwaysTrueIsFalse() {
        XCTAssertFalse(Case<Not<AlwaysTrue>>().isTrue)
    }

    func testNotAlwaysFalseIsTrue() {
        XCTAssertTrue(Case<Not<AlwaysFalse>>().isTrue)
    }

    func testAnyOfAlwaysFalseAndAlwaysTrueIsTrue() {
        XCTAssertTrue(Case<AnyOf<AlwaysFalse, AlwaysTrue>>().isTrue)
    }

    func testAnyOfAlwaysFalseAndAlwaysFalseIsFalse() {
        XCTAssertFalse(Case<AnyOf<AlwaysFalse, AlwaysFalse>>().isTrue)
    }

    func testAllOfAlwaysTrueAndAlwaysTrueIsTrue() {
        XCTAssertTrue(Case<AllOf<AlwaysTrue, AlwaysTrue>>().isTrue)
    }

    func testAllOfAlwaysTrueAndAlwaysFalseIsFalse() {
        XCTAssertFalse(Case<AllOf<AlwaysTrue, AlwaysFalse>>().isTrue)
    }

    func testConditionalValueSelectsThenBranchForTrueCondition() {
        let value = Int.value(Case<AlwaysTrue>(), 1, else: 2)
        XCTAssertEqual(value, 1)
    }

    func testConditionalValueSelectsElseBranchForFalseCondition() {
        let value = Int.value(Case<AlwaysFalse>(), 1, else: 2)
        XCTAssertEqual(value, 2)
    }

    func testWWDC25AliasExists() {
        let alias: Case<WWDC25> = .wwdc25
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
