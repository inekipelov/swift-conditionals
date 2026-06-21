/// Availability gate for visionOS 27 and later.
public struct VisionOS27: Condition {
    /// Evaluates whether visionOS 27 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(visionOS)
        if #available(visionOS 27.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the visionOS 27 availability check.
public extension ConditionKey where C == VisionOS27 {
    static var visionOS27: Self { Self() }
}
