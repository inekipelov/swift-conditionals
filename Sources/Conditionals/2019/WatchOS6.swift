public struct WatchOS6: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 6.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == WatchOS6 {
    static var watchOS6: Self { Self() }
}
