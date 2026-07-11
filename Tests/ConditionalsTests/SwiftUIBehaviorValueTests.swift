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

        _ = animation
    }

    @Test func scenePhaseCompilesWhenAvailable() {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
            let scenePhase = ScenePhase.value(ConditionKey<AlwaysTrue>(), .active, else: .background)
            _ = scenePhase
        }
    }

    @Test func controlSizeCompilesWhenAvailable() {
        if #available(iOS 15.0, macCatalyst 15.0, macOS 10.15, tvOS 15.0, visionOS 1.0, watchOS 9.0, *) {
            let controlSize = ControlSize.value(ConditionKey<AlwaysTrue>(), .large, else: .mini)
            _ = controlSize
        }
    }

    @Test func visibilityCompilesWhenAvailable() {
        if #available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *) {
            let visibility = Visibility.value(ConditionKey<AlwaysTrue>(), .visible, else: .hidden)
            _ = visibility
        }
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
