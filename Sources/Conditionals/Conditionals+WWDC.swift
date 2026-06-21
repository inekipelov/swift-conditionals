public extension Conditionals {
    struct WWDC19: Condition {
        public static func perform<Value>(
            then: () -> Value,
            else: () -> Value
        ) -> Value {
            if #available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *) {
                then()
            } else {
                `else`()
            }
        }
    }

    struct WWDC20: Condition {
        public static func perform<Value>(
            then: () -> Value,
            else: () -> Value
        ) -> Value {
            if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
                then()
            } else {
                `else`()
            }
        }
    }

    struct WWDC21: Condition {
        public static func perform<Value>(
            then: () -> Value,
            else: () -> Value
        ) -> Value {
            if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
                then()
            } else {
                `else`()
            }
        }
    }

    struct WWDC22: Condition {
        public static func perform<Value>(
            then: () -> Value,
            else: () -> Value
        ) -> Value {
            if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
                then()
            } else {
                `else`()
            }
        }
    }

    struct WWDC23: Condition {
        public static func perform<Value>(
            then: () -> Value,
            else: () -> Value
        ) -> Value {
            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *) {
                then()
            } else {
                `else`()
            }
        }
    }

    struct WWDC24: Condition {
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

    struct WWDC25: Condition {
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
}
