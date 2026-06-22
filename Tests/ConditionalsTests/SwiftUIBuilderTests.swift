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

    @MainActor
    @Test func commandsConditionalCompiles() {
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

    @MainActor
    @Test func sceneConditionalCompiles() {
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

    @MainActor
    @Test func tabContentConditionalCompilesWhenAvailable() {
        if #available(macOS 15.0, *) {
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
