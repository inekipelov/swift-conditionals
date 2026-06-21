public struct Not<C: Condition>: Condition {
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

public extension ConditionKey {
    static func not<Wrapped: Condition>(
        _ condition: ConditionKey<Wrapped>
    ) -> ConditionKey<Not<Wrapped>> {
        ConditionKey<Not<Wrapped>>()
    }
}
