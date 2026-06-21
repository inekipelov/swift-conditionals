public struct macOS27: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 27.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == macOS27 {
    static var macOS27: Self { Self() }
}
