public struct TVOS13: Condition {
    public static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(tvOS)
        if #available(tvOS 13.0, *) {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

public extension ConditionKey where C == TVOS13 {
    static var tvOS13: Self { Self() }
}
