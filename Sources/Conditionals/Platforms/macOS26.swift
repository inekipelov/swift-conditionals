public struct macOS26: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 26.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == macOS26 {
    static var macOS26: Self { Self() }
}
