public struct WWDC23: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

public extension ConditionKey where C == WWDC23 {
    static var wwdc23: Self { Self() }
}
