/// A predicate that chooses between two branches.
public protocol Condition: Sendable {
    /// Evaluates the condition and returns the selected branch.
    static func perform<Value>(
        then: () -> Value,
        else: () -> Value
    ) -> Value
}
