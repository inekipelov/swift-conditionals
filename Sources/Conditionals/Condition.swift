public protocol Condition: Sendable {
    static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value
}
