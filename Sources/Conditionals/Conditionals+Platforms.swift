public extension Conditionals {
    struct WatchOS11: Condition {
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

    struct TVOS18: Condition {
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

    struct VisionOS2: Condition {
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
}
