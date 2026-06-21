public extension ConditionKey {
    static func not<Wrapped: Condition>(
        _ condition: ConditionKey<Wrapped>
    ) -> ConditionKey<Not<Wrapped>> {
        ConditionKey<Not<Wrapped>>()
    }

    static func anyOf<First: Condition, Second: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>
    ) -> ConditionKey<AnyOf<First, Second>> {
        ConditionKey<AnyOf<First, Second>>()
    }

    static func anyOf<First: Condition, Second: Condition, Third: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>,
        _ third: ConditionKey<Third>
    ) -> ConditionKey<AnyOf3<First, Second, Third>> {
        ConditionKey<AnyOf3<First, Second, Third>>()
    }

    static func anyOf<First: Condition, Second: Condition, Third: Condition, Fourth: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>,
        _ third: ConditionKey<Third>,
        _ fourth: ConditionKey<Fourth>
    ) -> ConditionKey<AnyOf4<First, Second, Third, Fourth>> {
        ConditionKey<AnyOf4<First, Second, Third, Fourth>>()
    }

    static func allOf<First: Condition, Second: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>
    ) -> ConditionKey<AllOf<First, Second>> {
        ConditionKey<AllOf<First, Second>>()
    }

    static func allOf<First: Condition, Second: Condition, Third: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>,
        _ third: ConditionKey<Third>
    ) -> ConditionKey<AllOf3<First, Second, Third>> {
        ConditionKey<AllOf3<First, Second, Third>>()
    }

    static func allOf<First: Condition, Second: Condition, Third: Condition, Fourth: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>,
        _ third: ConditionKey<Third>,
        _ fourth: ConditionKey<Fourth>
    ) -> ConditionKey<AllOf4<First, Second, Third, Fourth>> {
        ConditionKey<AllOf4<First, Second, Third, Fourth>>()
    }
}
