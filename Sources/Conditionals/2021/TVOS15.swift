/// Availability gate for tvOS 15 and later.
public struct TVOS15: Condition {
    /// Evaluates whether tvOS 15 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 15.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS 15 availability check.
public extension ConditionKey where C == TVOS15 {
    static var tvOS15: Self { Self() }
}
