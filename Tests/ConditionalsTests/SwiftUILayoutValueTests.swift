#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Layout Values")
struct SwiftUILayoutValueTests {
    @Test func layoutValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let alignment = Alignment.value(condition, .leading, else: .trailing)
        let horizontal = HorizontalAlignment.value(condition, .leading, else: .trailing)
        let vertical = VerticalAlignment.value(condition, .top, else: .bottom)
        let point = UnitPoint.value(condition, .topLeading, else: .bottomTrailing)
        let edge = Edge.value(condition, .top, else: .bottom)
        let edges = Edge.Set.value(condition, .horizontal, else: .vertical)
        let axis = Axis.value(condition, .horizontal, else: .vertical)
        let axes = Axis.Set.value(condition, .horizontal, else: .vertical)
        let contentMode = ContentMode.value(condition, .fit, else: .fill)
        let sizeClass = UserInterfaceSizeClass.value(condition, .regular, else: .compact)
        let layoutDirection = LayoutDirection.value(condition, .rightToLeft, else: .leftToRight)

        _ = alignment
        _ = horizontal
        _ = vertical
        _ = point
        _ = edge
        _ = edges
        _ = axis
        _ = axes
        _ = contentMode
        _ = sizeClass
        _ = layoutDirection
    }

    @Test func pinnedScrollableViewsCompileWhenAvailable() {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
            let pinned = PinnedScrollableViews.value(
                ConditionKey<AlwaysTrue>(),
                .sectionHeaders,
                else: .sectionFooters
            )
            _ = pinned
        }
    }
}
#endif
