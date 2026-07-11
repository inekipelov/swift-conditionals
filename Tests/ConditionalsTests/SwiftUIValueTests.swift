#if canImport(SwiftUI)
import Testing
import SwiftUI
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Values")
struct SwiftUIValueTests {
    @Test func coreSwiftUIValuesCompile() {
        let scenePhase = ScenePhase.value(ConditionKey<AlwaysTrue>(), .active, else: .background)
        let controlSize = ControlSize.value(ConditionKey<AlwaysTrue>(), .large, else: .mini)

        _ = scenePhase
        _ = controlSize
    }

    @Test func placementAndPresentationValuesCompile() {
        let toolbarPlacement = ToolbarItemPlacement.value(ConditionKey<AlwaysTrue>(), .automatic, else: .automatic)
        let commandGroupPlacement = CommandGroupPlacement.value(ConditionKey<AlwaysTrue>(), .toolbar, else: .sidebar)
        let toolbarRole = ToolbarRole.value(ConditionKey<AlwaysTrue>(), .automatic, else: .automatic)
        let navigationVisibility = NavigationSplitViewVisibility.value(ConditionKey<AlwaysTrue>(), .all, else: .detailOnly)
        let visibility = Visibility.value(ConditionKey<AlwaysTrue>(), .visible, else: .hidden)
        let presentationDetent = PresentationDetent.value(ConditionKey<AlwaysTrue>(), .large, else: .medium)
        let backgroundInteraction = PresentationBackgroundInteraction.value(ConditionKey<AlwaysTrue>(), .enabled, else: .disabled)

        _ = toolbarPlacement
        _ = commandGroupPlacement
        _ = toolbarRole
        _ = navigationVisibility
        _ = visibility
        _ = presentationDetent
        _ = backgroundInteraction
    }

    @Test func tabPlacementSelectsThroughConditionalValueWhenAvailable() {
        if #available(macOS 15.0, *) {
            let tabPlacement = TabPlacement.value(ConditionKey<AlwaysTrue>(), .pinned, else: .sidebarOnly)
            _ = tabPlacement
        }
    }

    #if os(iOS) || os(tvOS) || os(visionOS) || targetEnvironment(macCatalyst)
    @Test func editModeSelectsThroughConditionalValueWhenAvailable() {
        let editMode = EditMode.value(ConditionKey<AlwaysTrue>(), .active, else: .inactive)
        _ = editMode
    }
    #endif
}
#endif
