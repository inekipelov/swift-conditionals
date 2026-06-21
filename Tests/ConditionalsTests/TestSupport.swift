import Testing
@testable import Conditionals

struct AlwaysTrue: Condition {
    static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        then()
    }
}

struct AlwaysFalse: Condition {
    static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        `else`()
    }
}
