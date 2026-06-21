public struct WWDC26: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 27.0, macOS 27.0, tvOS 27.0, watchOS 27.0, visionOS 27.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

public extension ConditionKey where C == WWDC26 {
    static var wwdc26: Self { Self() }
}
