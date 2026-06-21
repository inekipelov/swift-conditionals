public protocol ConditionalValue {}

public extension ConditionalValue {
    static func value<C: Condition>(
        _ condition: Conditionals.Case<C>,
        _ value: @autoclosure () -> Self,
        else fallback: @autoclosure () -> Self
    ) -> Self {
        condition.value(
            then: value(),
            else: fallback()
        )
    }

    static func value<C: Condition>(
        _ condition: Conditionals.Case<C>,
        then value: () -> Self,
        else fallback: () -> Self
    ) -> Self {
        condition(
            then: value,
            else: fallback
        )
    }
}
