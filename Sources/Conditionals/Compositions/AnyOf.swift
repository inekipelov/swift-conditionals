/// A condition that succeeds when the first or second condition succeeds.
public struct AnyOf<A: Condition, B: Condition>: Condition {
    /// Evaluates the wrapped conditions in order until one succeeds.
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

/// A condition that succeeds when any of three conditions succeeds.
public struct AnyOf3<A: Condition, B: Condition, C: Condition>: Condition {
    /// Evaluates the wrapped conditions in order until one succeeds.
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

/// A condition that succeeds when any of four conditions succeeds.
public struct AnyOf4<A: Condition, B: Condition, C: Condition, D: Condition>: Condition {
    /// Evaluates the wrapped conditions in order until one succeeds.
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

/// Convenience constructors for disjunctive conditions.
public extension ConditionKey {
    /// Creates a condition that succeeds when either condition succeeds.
    static func anyOf<First: Condition, Second: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>
    ) -> ConditionKey<AnyOf<First, Second>> {
        ConditionKey<AnyOf<First, Second>>()
    }

    /// Creates a condition that succeeds when any of three conditions succeeds.
    static func anyOf<First: Condition, Second: Condition, Third: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>,
        _ third: ConditionKey<Third>
    ) -> ConditionKey<AnyOf3<First, Second, Third>> {
        ConditionKey<AnyOf3<First, Second, Third>>()
    }

    /// Creates a condition that succeeds when any of four conditions succeeds.
    static func anyOf<First: Condition, Second: Condition, Third: Condition, Fourth: Condition>(
        _ lhs: ConditionKey<First>,
        _ rhs: ConditionKey<Second>,
        _ third: ConditionKey<Third>,
        _ fourth: ConditionKey<Fourth>
    ) -> ConditionKey<AnyOf4<First, Second, Third, Fourth>> {
        ConditionKey<AnyOf4<First, Second, Third, Fourth>>()
    }
}
