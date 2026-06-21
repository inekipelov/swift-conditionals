public struct WatchOS10: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 10.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == WatchOS10 {
    static var watchOS10: Self { Self() }
}
