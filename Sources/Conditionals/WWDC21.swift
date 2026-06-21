public struct WWDC21: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

public extension ConditionKey where C == WWDC21 {
    static var wwdc21: Self { Self() }
}
