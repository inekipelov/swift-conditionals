/// Availability gate for tvOS 17 and later.
public struct TVOS17: Condition {
    /// Evaluates whether tvOS 17 or newer is available on the current platform.
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 17.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS 17 availability check.
public extension ConditionKey where C == TVOS17 {
    static var tvOS17: Self { Self() }
}
