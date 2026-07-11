#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Behavior Values")
struct SwiftUIBehaviorValueTests {
    @Test func behaviorValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let animation = Animation.value(condition, .linear, else: .easeIn)
        let scenePhase = ScenePhase.value(condition, .active, else: .background)
        let controlSize = ControlSize.value(condition, .large, else: .mini)
        let visibility = Visibility.value(condition, .visible, else: .hidden)

        _ = animation
        _ = scenePhase
        _ = controlSize
        _ = visibility
    }

    @Test func redactionReasonsCompileWhenAvailable() {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
            let reasons = RedactionReasons.value(
                ConditionKey<AlwaysTrue>(),
                .placeholder,
                else: []
            )
            _ = reasons
        }
    }

    #if os(iOS) || os(tvOS) || os(visionOS) || targetEnvironment(macCatalyst)
    @Test func editModeCompiles() {
        let editMode = EditMode.value(ConditionKey<AlwaysTrue>(), .active, else: .inactive)
        _ = editMode
    }
    #endif
}
#endif
