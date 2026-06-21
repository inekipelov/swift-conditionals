public struct TVOS27: Condition {
    public static func perform<Value>(
        then: () -> Value,
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

public extension ConditionKey where C == TVOS27 {
    static var tvOS27: Self { Self() }
}
