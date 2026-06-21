/// Availability gate for tvOS 14 and later.
public struct TVOS14: Condition {
    /// Evaluates whether tvOS 14 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 14.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS 14 availability check.
public extension ConditionKey where C == TVOS14 {
    static var tvOS14: Self { Self() }
}
