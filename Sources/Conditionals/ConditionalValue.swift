/// A value that can be selected through a `ConditionKey`.
public protocol ConditionalValue {}

/// Conditional value helpers for types that can opt into availability-based selection.
public extension ConditionalValue {
    /// Selects between two values using the supplied condition.
    @inlinable
    static func value<C: Condition>(
        _ condition: ConditionKey<C>,
        _ thenValue: @autoclosure () -> Self,
        else elseValue: @autoclosure () -> Self
    ) -> Self {
        condition.value(
            then: thenValue(),
            else: elseValue()
        )
    }

    /// Selects between two value-producing closures using the supplied condition.
    @inlinable
    static func value<C: Condition>(
        _ condition: ConditionKey<C>,
        _ thenValue: () -> Self,
        else elseValue: () -> Self
    ) -> Self {
        condition(
            then: thenValue,
            else: elseValue
        )
    }
}
