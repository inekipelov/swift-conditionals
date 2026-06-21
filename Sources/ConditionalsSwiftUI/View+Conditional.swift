#if canImport(SwiftUI)
import SwiftUI
import Conditionals

public extension View {
    @ViewBuilder
    func conditional<C: Condition, Modified: View>(
        _ condition: Case<C>,
        @ViewBuilder then transform: @MainActor (Self) -> Modified
    ) -> some View {
        if condition.isTrue {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder
    func conditional<C: Condition, Then: View, Else: View>(
        _ condition: Case<C>,
        @ViewBuilder then thenTransform: @MainActor (Self) -> Then,
        @ViewBuilder else elseTransform: @MainActor (Self) -> Else
    ) -> some View {
        if condition.isTrue {
            thenTransform(self)
        } else {
            elseTransform(self)
        }
    }
}
#endif
