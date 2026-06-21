/// A condition that inverts another condition.
public struct Not<C: Condition>: Condition {
    /// Evaluates the wrapped condition and swaps its branches.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        C.perform(
            then: `else`,
            else: then
        )
    }
}

/// Convenience constructors for negated conditions.
public extension ConditionKey {
    /// Creates the inverse of the supplied condition.
    static func not<Wrapped: Condition>(
        _ condition: ConditionKey<Wrapped>
    ) -> ConditionKey<Not<Wrapped>> {
        ConditionKey<Not<Wrapped>>()
    }
}
