/// Availability gate for visionOS 26 and later.
public struct VisionOS26: Condition {
    /// Evaluates whether visionOS 26 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
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

/// A key for the visionOS 26 availability check.
public extension ConditionKey where C == VisionOS26 {
    static var visionOS26: Self { Self() }
}
