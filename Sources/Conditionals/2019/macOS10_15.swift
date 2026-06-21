public struct macOS10_15: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 10.15, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == macOS10_15 {
    static var macOS10_15: Self { Self() }
}
