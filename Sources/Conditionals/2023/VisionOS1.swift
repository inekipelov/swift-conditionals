public struct VisionOS1: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(visionOS)
        if #available(visionOS 1.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == VisionOS1 {
    static var visionOS1: Self { Self() }
}
