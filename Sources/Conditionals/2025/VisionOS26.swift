public struct VisionOS26: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(visionOS)
        if #available(visionOS 26.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == VisionOS26 {
    static var visionOS26: Self { Self() }
}
