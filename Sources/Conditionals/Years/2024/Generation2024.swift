public struct WWDC24: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        if #available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *) {
            then()
        } else {
            `else`()
        }
    }
}

public struct WatchOS11: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(watchOS)
        if #available(watchOS 11.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public struct TVOS18: Condition {
    public static func perform<Value>(
        then: () -> Value,
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

public struct VisionOS2: Condition {
    public static func perform<Value>(
        then: () -> Value,
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

public struct iOS18: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS)
        if #available(iOS 18.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public struct macOS15: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(macOS)
        if #available(macOS 15.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == WWDC24 {
    static var wwdc24: Self { Self() }
}

public extension ConditionKey where C == WatchOS11 {
    static var watchOS11: Self { Self() }
}

public extension ConditionKey where C == TVOS18 {
    static var tvOS18: Self { Self() }
}

public extension ConditionKey where C == VisionOS2 {
    static var visionOS2: Self { Self() }
}

public extension ConditionKey where C == iOS18 {
    static var iOS18: Self { Self() }
}

public extension ConditionKey where C == macOS15 {
    static var macOS15: Self { Self() }
}
