/// A typed wrapper for evaluating a specific `Condition`.
public struct ConditionKey<C: Condition>: Sendable {
    /// Creates a key for the wrapped condition.
    public init() {}

    /// `true` when the wrapped condition selects the `then` branch.
    public var isSatisfied: Bool {
        C.perform({ true }, else: { false })
    }

    /// Evaluates the wrapped condition with explicit branch closures.
    public func callAsFunction<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        C.perform(then, else: `else`)
    }

    /// Evaluates the wrapped condition with autoclosure branches.
    public func value<Value>(
        then: @autoclosure () -> Value,
        else: @autoclosure () -> Value
    ) -> Value {
        C.perform( then, else: `else`)
    }
}
