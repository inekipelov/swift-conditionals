/// A value that can be selected through a `ConditionKey`.
public protocol ConditionalValue {}

/// Conditional value helpers for types that can opt into availability-based selection.
public extension ConditionalValue {
    /// Selects between two values using the supplied condition.
    static func value<C: Condition>(
        _ condition: ConditionKey<C>,
        _ value: @autoclosure () -> Self,
        else fallback: @autoclosure () -> Self
    ) -> Self {
        condition.value(
            then: value(),
            else: fallback()
        )
    }

    /// Selects between two value-producing closures using the supplied condition.
    static func value<C: Condition>(
        _ condition: ConditionKey<C>,
        then value: () -> Self,
        else fallback: () -> Self
    ) -> Self {
        condition(
            then: value,
            else: fallback
        )
    }
}
