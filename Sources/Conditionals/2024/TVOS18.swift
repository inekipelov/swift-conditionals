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

public extension ConditionKey where C == TVOS18 {
    static var tvOS18: Self { Self() }
}
