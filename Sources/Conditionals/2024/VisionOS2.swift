public struct VisionOS2: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(visionOS)
        if #available(visionOS 2.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == VisionOS2 {
    static var visionOS2: Self { Self() }
}
