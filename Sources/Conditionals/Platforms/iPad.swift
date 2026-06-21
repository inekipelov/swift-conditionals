#if canImport(UIKit)
import UIKit
#endif

/// Availability gate for iPad.
public struct iPad: Condition {
    /// Evaluates whether the current UIKit idiom is iPad.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if canImport(UIKit)
        if UIDevice.current.userInterfaceIdiom == .pad {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iPad idiom check.
public extension ConditionKey where C == iPad {
    static var iPad: Self { Self() }
}
