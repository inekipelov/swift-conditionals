public struct iOS18: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 18.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == iOS18 {
    static var iOS18: Self { Self() }
}
