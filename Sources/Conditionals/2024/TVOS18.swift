/// Availability gate for tvOS 18 and later.
public struct TVOS18: Condition {
    /// Evaluates whether tvOS 18 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 18.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS 18 availability check.
public extension ConditionKey where C == TVOS18 {
    static var tvOS18: Self { Self() }
}
