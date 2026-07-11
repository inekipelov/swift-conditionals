/// Availability gate for tvOS 27 and later.
public struct TVOS27: Condition {
    /// Evaluates whether tvOS 27 or newer is available on the current platform.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 27.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the tvOS 27 availability check.
public extension ConditionKey where C == TVOS27 {
    static var tvOS27: Self { Self() }
}
