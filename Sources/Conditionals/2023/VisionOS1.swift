/// Availability gate for visionOS 1 and later.
public struct VisionOS1: Condition {
    /// Evaluates whether visionOS 1 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
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

/// A key for the visionOS 1 availability check.
public extension ConditionKey where C == VisionOS1 {
    static var visionOS1: Self { Self() }
}
