/// Availability gate for visionOS.
public struct visionOS: Condition {
    /// Evaluates whether the code is running on visionOS.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(visionOS)
        then()
        #else
        `else`()
        #endif
    }
}

/// A key for the visionOS platform check.
public extension ConditionKey where C == visionOS {
    static var visionOS: Self { Self() }
}
