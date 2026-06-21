/// A condition that succeeds only when both conditions succeed.
public struct AllOf<A: Condition, B: Condition>: Condition {
    /// Evaluates the wrapped conditions in order and requires both to succeed.
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

/// A condition that succeeds only when all three conditions succeed.
public struct AllOf3<A: Condition, B: Condition, C: Condition>: Condition {
    /// Evaluates the wrapped conditions in order and requires all to succeed.
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

/// A condition that succeeds only when all four conditions succeed.
public struct AllOf4<A: Condition, B: Condition, C: Condition, D: Condition>: Condition {
    /// Evaluates the wrapped conditions in order and requires all to succeed.
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

/// Convenience constructors for conjunctive conditions.
public extension ConditionKey {
    /// Creates a condition that succeeds only when both conditions succeed.
    static func allOf<First: Condition, Second: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>
    ) -> ConditionKey<AllOf<First, Second>> {
        ConditionKey<AllOf<First, Second>>()
    }

    /// Creates a condition that succeeds only when all three conditions succeed.
    static func allOf<First: Condition, Second: Condition, Third: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>,
        _ third: ConditionKey<Third>
    ) -> ConditionKey<AllOf3<First, Second, Third>> {
        ConditionKey<AllOf3<First, Second, Third>>()
    }

    /// Creates a condition that succeeds only when all four conditions succeed.
    static func allOf<First: Condition, Second: Condition, Third: Condition, Fourth: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>,
        _ third: ConditionKey<Third>,
        _ fourth: ConditionKey<Fourth>
    ) -> ConditionKey<AllOf4<First, Second, Third, Fourth>> {
        ConditionKey<AllOf4<First, Second, Third, Fourth>>()
    }
}
