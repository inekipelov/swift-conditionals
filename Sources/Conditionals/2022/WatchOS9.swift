public struct WatchOS9: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 9.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == WatchOS9 {
    static var watchOS9: Self { Self() }
}
