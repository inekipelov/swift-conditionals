public struct Case<C: Condition>: Sendable {
    public init() {}

    public var isTrue: Bool {
        C.perform(
            then: { true },
            else: { false }
        )
    }

    public func callAsFunction<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        C.perform(
            then: then,
            else: `else`
        )
    }

    public func value<Value>(
        then: @autoclosure () -> Value,
        else: @autoclosure () -> Value
    ) -> Value {
        C.perform(
            then: then,
            else: `else`
        )
    }
}
