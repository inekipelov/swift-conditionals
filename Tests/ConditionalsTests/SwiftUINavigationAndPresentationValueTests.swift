#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Navigation and Presentation Values")
struct SwiftUINavigationAndPresentationValueTests {
    @Test func placementAndPresentationValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let toolbarPlacement = ToolbarItemPlacement.value(condition, .automatic, else: .automatic)
        let commandGroupPlacement = CommandGroupPlacement.value(condition, .toolbar, else: .sidebar)
        let toolbarRole = ToolbarRole.value(condition, .automatic, else: .automatic)
        let navigationVisibility = NavigationSplitViewVisibility.value(condition, .all, else: .detailOnly)
        let presentationDetent = PresentationDetent.value(condition, .large, else: .medium)
        let backgroundInteraction = PresentationBackgroundInteraction.value(
            condition,
            .enabled,
            else: .disabled
        )

        _ = toolbarPlacement
        _ = commandGroupPlacement
        _ = toolbarRole
        _ = navigationVisibility
        _ = presentationDetent
        _ = backgroundInteraction
    }

    @Test func tabPlacementCompilesWhenAvailable() {
        if #available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *) {
            let placement = TabPlacement.value(
                ConditionKey<AlwaysTrue>(),
                .pinned,
                else: .sidebarOnly
            )
            _ = placement
        }
    }
}
#endif
