#if os(iOS) || targetEnvironment(macCatalyst)
import UIKit
#endif

/// Availability gate for iPhone.
public struct iPhone: Condition {
    /// Evaluates whether the current UIKit idiom is iPhone.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if os(iOS) || targetEnvironment(macCatalyst)
        if currentUserInterfaceIdiom() == .phone {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// A key for the iPhone idiom check.
public extension ConditionKey where C == iPhone {
    static var iPhone: Self { Self() }
}
