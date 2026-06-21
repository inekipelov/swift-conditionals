#if canImport(SwiftUI)
import SwiftUI
@_exported import Conditionals

/// SwiftUI helpers for conditionally transforming a view.
public extension View {
    /// Applies `then` when the condition is `true`; otherwise returns the original view.
    @ViewBuilder
    func conditional<C: Condition, Modified: View>(
        _ condition: ConditionKey<C>,
        @ViewBuilder then transform: @MainActor (Self) -> Modified
    ) -> some View {
        if condition.isSatisfied {
            transform(self)
        } else {
            self
        }
    }

    /// Applies one of two transforms based on the condition.
    @ViewBuilder
    func conditional<C: Condition, Then: View, Else: View>(
        _ condition: ConditionKey<C>,
        @ViewBuilder then thenTransform: @MainActor (Self) -> Then,
        @ViewBuilder else elseTransform: @MainActor (Self) -> Else
    ) -> some View {
        if condition.isSatisfied {
            thenTransform(self)
        } else {
            elseTransform(self)
        }
    }
}
#endif
