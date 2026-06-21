import XCTest
@testable import Conditionals
@testable import ConditionalsSwiftUI

final class ConditionalsTests: XCTestCase {
    func testCaseIsTrueWithAlwaysTrueCondition() {
        XCTAssertTrue(Conditionals.Case<AlwaysTrue>().isTrue)
    }

    func testCaseIsTrueWithAlwaysFalseCondition() {
        XCTAssertFalse(Conditionals.Case<AlwaysFalse>().isTrue)
    }

    func testNotAlwaysTrueIsFalse() {
        XCTAssertFalse(Conditionals.Case<Conditionals.Not<AlwaysTrue>>().isTrue)
    }

    func testNotAlwaysFalseIsTrue() {
        XCTAssertTrue(Conditionals.Case<Conditionals.Not<AlwaysFalse>>().isTrue)
    }

    func testAnyOfAlwaysFalseAndAlwaysTrueIsTrue() {
        XCTAssertTrue(Conditionals.Case<Conditionals.AnyOf<AlwaysFalse, AlwaysTrue>>().isTrue)
    }

    func testAnyOfAlwaysFalseAndAlwaysFalseIsFalse() {
        XCTAssertFalse(Conditionals.Case<Conditionals.AnyOf<AlwaysFalse, AlwaysFalse>>().isTrue)
    }

    func testAllOfAlwaysTrueAndAlwaysTrueIsTrue() {
        XCTAssertTrue(Conditionals.Case<Conditionals.AllOf<AlwaysTrue, AlwaysTrue>>().isTrue)
    }

    func testAllOfAlwaysTrueAndAlwaysFalseIsFalse() {
        XCTAssertFalse(Conditionals.Case<Conditionals.AllOf<AlwaysTrue, AlwaysFalse>>().isTrue)
    }

    func testConditionalValueSelectsThenBranchForTrueCondition() {
        let value = Int.value(Conditionals.Case<AlwaysTrue>(), 1, else: 2)
        XCTAssertEqual(value, 1)
    }

    func testConditionalValueSelectsElseBranchForFalseCondition() {
        let value = Int.value(Conditionals.Case<AlwaysFalse>(), 1, else: 2)
        XCTAssertEqual(value, 2)
    }

    func testWWDC25AliasExists() {
        let alias: Conditionals.Case<Conditionals.WWDC25> = .wwdc25
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
