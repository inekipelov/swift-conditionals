public struct AnyOf<A: Condition, B: Condition>: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        A.perform {
            then()
        } else: {
            B.perform {
                then()
            } else: {
                `else`()
            }
        }
    }
}

public struct AnyOf3<A: Condition, B: Condition, C: Condition>: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        A.perform {
            then()
        } else: {
            B.perform {
                then()
            } else: {
                C.perform {
                    then()
                } else: {
                    `else`()
                }
            }
        }
    }
}

public struct AnyOf4<A: Condition, B: Condition, C: Condition, D: Condition>: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        A.perform {
            then()
        } else: {
            B.perform {
                then()
            } else: {
                C.perform {
                    then()
                } else: {
                    D.perform {
                        then()
                    } else: {
                        `else`()
                    }
                }
            }
        }
    }
}

public extension ConditionKey {
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
}
