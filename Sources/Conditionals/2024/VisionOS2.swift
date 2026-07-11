/// Availability gate for visionOS 2 and later.
public struct VisionOS2: Condition {
    /// Evaluates whether visionOS 2 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
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

/// A key for the visionOS 2 availability check.
public extension ConditionKey where C == VisionOS2 {
    static var visionOS2: Self { Self() }
}
