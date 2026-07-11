#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Navigation and Presentation Values")
struct SwiftUINavigationAndPresentationValueTests {
    @Test func toolbarPlacementCompilesWhenAvailable() {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
            let placement = ToolbarItemPlacement.value(ConditionKey<AlwaysTrue>(), .automatic, else: .automatic)
            _ = placement
        }
    }

    #if os(iOS) || os(macOS) || os(visionOS) || targetEnvironment(macCatalyst)
    @Test func commandGroupPlacementCompilesWhenAvailable() {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, visionOS 1.0, *) {
            let placement = CommandGroupPlacement.value(ConditionKey<AlwaysTrue>(), .toolbar, else: .sidebar)
            _ = placement
        }
    }
    #endif

    @Test func navigationAndPresentationValuesCompileWhenAvailable() {
        if #available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *) {
            let condition = ConditionKey<AlwaysTrue>()
            let toolbarRole = ToolbarRole.value(condition, .automatic, else: .automatic)
            let navigationVisibility = NavigationSplitViewVisibility.value(condition, .all, else: .detailOnly)
            let presentationDetent = PresentationDetent.value(condition, .large, else: .medium)

            _ = toolbarRole
            _ = navigationVisibility
            _ = presentationDetent
        }
    }

    @Test func backgroundInteractionCompilesWhenAvailable() {
        if #available(iOS 16.4, macCatalyst 16.4, macOS 13.3, tvOS 16.4, visionOS 1.0, watchOS 9.4, *) {
            let interaction = PresentationBackgroundInteraction.value(
                ConditionKey<AlwaysTrue>(),
                .enabled,
                else: .disabled
            )
            _ = interaction
        }
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
