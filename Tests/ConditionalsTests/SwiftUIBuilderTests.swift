#if canImport(SwiftUI)
import Testing
import SwiftUI
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Builders")
struct SwiftUIBuilderTests {
    @MainActor
    @Test func bareConditionalCompiles() {
        let transformed = Text("Content").conditional { view in
            view.frame(maxWidth: .infinity, alignment: .leading)
        }

        _ = transformed
    }

    @MainActor
    @Test func viewConditionalCompiles() {
        let oneBranch = Text("Content").conditional(ConditionKey<AlwaysTrue>()) { view in
            view
        }

        let twoBranch = Text("Content").conditional(ConditionKey<AlwaysFalse>()) { view in
            view
        } else: { view in
            view
        }

        _ = oneBranch
        _ = twoBranch
    }

    @MainActor
    @Test func toolbarContentConditionalCompiles() {
        if #available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *) {
            let oneBranch = ToolbarItemGroup(placement: .automatic) {
            }
            .conditional(ConditionKey<AlwaysTrue>()) { content in
                content
            }

            let twoBranch = ToolbarItemGroup(placement: .automatic) {
            }
            .conditional(ConditionKey<AlwaysFalse>()) { content in
                content
            } else: { content in
                content
            }

            _ = oneBranch
            _ = twoBranch
        }
    }

    #if os(iOS) || os(macOS) || os(visionOS) || targetEnvironment(macCatalyst)
    @MainActor
    @Test func commandsConditionalCompiles() {
        if #available(iOS 16.0, macCatalyst 16.0, macOS 13.0, visionOS 1.0, *) {
            let oneBranch = CommandMenu("File") {
            }
            .conditional(ConditionKey<AlwaysTrue>()) { content in
                content
            }

            let twoBranch = CommandMenu("File") {
            }
            .conditional(ConditionKey<AlwaysFalse>()) { content in
                content
            } else: { content in
                content
            }

            _ = oneBranch
            _ = twoBranch
        }
    }
    #endif

    @MainActor
    @Test func sceneConditionalCompiles() {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
            let oneBranch = WindowGroup {
                Text("Content")
            }
            .conditional(ConditionKey<AlwaysTrue>()) { content in
                content
            }

            let twoBranch = WindowGroup {
                Text("Content")
            }
            .conditional(ConditionKey<AlwaysFalse>()) { content in
                content
            } else: { content in
                content
            }

            _ = oneBranch
            _ = twoBranch
        }
    }

    @MainActor
    @Test func tabContentConditionalCompilesWhenAvailable() {
        if #available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *) {
            let oneBranch = TabSection {
                Tab("One", systemImage: "1.circle", value: 1) {
                    Text("One")
                }
            }
            .conditional(ConditionKey<AlwaysTrue>()) { content in
                content
            }

            let twoBranch = TabSection {
                Tab("One", systemImage: "1.circle", value: 1) {
                    Text("One")
                }
            }
            .conditional(ConditionKey<AlwaysFalse>()) { content in
                content
            } else: { content in
                content
            }

            _ = oneBranch
            _ = twoBranch
        }
    }
}
#endif
