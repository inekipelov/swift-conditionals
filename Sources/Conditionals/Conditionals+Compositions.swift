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
