public struct WWDC25: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

public struct iOS26: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 26.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public struct macOS26: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 26.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == WWDC25 {
    static var wwdc25: Self { Self() }
}

public extension ConditionKey where C == iOS26 {
    static var iOS26: Self { Self() }
}

public extension ConditionKey where C == macOS26 {
    static var macOS26: Self { Self() }
}
