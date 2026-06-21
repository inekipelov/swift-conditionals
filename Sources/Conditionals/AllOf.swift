public struct AllOf<A: Condition, B: Condition>: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        A.perform {
            B.perform {
                then()
            } else: {
                `else`()
            }
        } else: {
            `else`()
        }
    }
}

public struct AllOf3<A: Condition, B: Condition, C: Condition>: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        A.perform {
            B.perform {
                C.perform {
                    then()
                } else: {
                    `else`()
                }
            } else: {
                `else`()
            }
        } else: {
            `else`()
        }
    }
}

public struct AllOf4<A: Condition, B: Condition, C: Condition, D: Condition>: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        A.perform {
            B.perform {
                C.perform {
                    D.perform {
                        then()
                    } else: {
                        `else`()
                    }
                } else: {
                    `else`()
                }
            } else: {
                `else`()
            }
        } else: {
            `else`()
        }
    }
}

public extension ConditionKey {
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
