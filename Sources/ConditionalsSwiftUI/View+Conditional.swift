#if canImport(SwiftUI)
import SwiftUI
@_exported import Conditionals

/// SwiftUI helpers for conditionally transforming a view.
public extension View {
    /// Applies `then` when the condition is `true`; otherwise returns the original view.
    @ViewBuilder
    @inlinable
    func conditional<C: Condition, Modified: View>(
        _ condition: ConditionKey<C>,
        @ViewBuilder then thenContent: @MainActor (Self) -> Modified
    ) -> some View {
        if condition.isSatisfied {
            thenContent(self)
        } else {
            self
        }
    }

    /// Applies one of two transforms based on the condition.
    @ViewBuilder
    @inlinable
    func conditional<C: Condition, Then: View, Else: View>(
        _ condition: ConditionKey<C>,
        @ViewBuilder then thenContent: @MainActor (Self) -> Then,
        @ViewBuilder else elseContent: @MainActor (Self) -> Else
    ) -> some View {
        if condition.isSatisfied {
            thenContent(self)
        } else {
            elseContent(self)
        }
    }
}
#endif
