public struct WWDC19: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

public extension ConditionKey where C == WWDC19 {
    static var wwdc19: Self { Self() }
}
