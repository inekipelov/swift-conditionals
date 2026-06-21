import Testing
import SwiftUI
@testable import Conditionals
@testable import ConditionalsSwiftUI

private struct AlwaysTrue: Condition {
    static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        then()
    }
}

private struct AlwaysFalse: Condition {
    static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        `else`()
    }
}

@Suite("Conditionals")
struct ConditionalsTests {
    @Test func caseIsTrueWithAlwaysTrueCondition() {
        #expect(ConditionKey<AlwaysTrue>().isSatisfied)
    }

    @Test func caseIsTrueWithAlwaysFalseCondition() {
        #expect(!ConditionKey<AlwaysFalse>().isSatisfied)
    }

    @Test func notAlwaysTrueIsFalse() {
        #expect(!ConditionKey<Not<AlwaysTrue>>().isSatisfied)
    }

    @Test func notAlwaysFalseIsTrue() {
        #expect(ConditionKey<Not<AlwaysFalse>>().isSatisfied)
    }

    @Test func anyOfAlwaysFalseAndAlwaysTrueIsTrue() {
        #expect(ConditionKey<AnyOf<AlwaysFalse, AlwaysTrue>>().isSatisfied)
    }

    @Test func anyOfAlwaysFalseAndAlwaysFalseIsFalse() {
        #expect(!ConditionKey<AnyOf<AlwaysFalse, AlwaysFalse>>().isSatisfied)
    }

    @Test func allOfAlwaysTrueAndAlwaysTrueIsTrue() {
        #expect(ConditionKey<AllOf<AlwaysTrue, AlwaysTrue>>().isSatisfied)
    }

    @Test func allOfAlwaysTrueAndAlwaysFalseIsFalse() {
        #expect(!ConditionKey<AllOf<AlwaysTrue, AlwaysFalse>>().isSatisfied)
    }

    @Test func conditionalValueSelectsThenBranchForTrueCondition() {
        let value = Int.value(ConditionKey<AlwaysTrue>(), 1, else: 2)
        #expect(value == 1)
    }

    @Test func conditionalValueSelectsElseBranchForFalseCondition() {
        let value = Int.value(ConditionKey<AlwaysFalse>(), 1, else: 2)
        #expect(value == 2)
    }

    @Test func swiftUIValueTypesSelectThroughConditionalValue() {
        let colorScheme = ColorScheme.value(ConditionKey<AlwaysTrue>(), .dark, else: .light)
        let colorSchemeContrast = ColorSchemeContrast.value(ConditionKey<AlwaysTrue>(), .increased, else: .standard)
        let legibility = LegibilityWeight.value(ConditionKey<AlwaysTrue>(), .bold, else: .regular)
        let sizeClass = UserInterfaceSizeClass.value(ConditionKey<AlwaysTrue>(), .regular, else: .compact)
        let layoutDirection = LayoutDirection.value(ConditionKey<AlwaysTrue>(), .rightToLeft, else: .leftToRight)
        let scenePhase = ScenePhase.value(ConditionKey<AlwaysTrue>(), .active, else: .background)
        let controlSize = ControlSize.value(ConditionKey<AlwaysTrue>(), .large, else: .mini)
        let dynamicTypeSize = DynamicTypeSize.value(ConditionKey<AlwaysTrue>(), .xxxLarge, else: .small)
        let symbolRenderingMode = SymbolRenderingMode.value(ConditionKey<AlwaysTrue>(), .palette, else: .monochrome)
        let symbolVariants = SymbolVariants.value(ConditionKey<AlwaysTrue>(), .fill, else: .none)
        let submitLabel = SubmitLabel.value(ConditionKey<AlwaysTrue>(), .done, else: .go)

        _ = colorScheme
        _ = colorSchemeContrast
        _ = legibility
        _ = sizeClass
        _ = layoutDirection
        _ = scenePhase
        _ = controlSize
        _ = dynamicTypeSize
        _ = symbolRenderingMode
        _ = symbolVariants
        _ = submitLabel
    }

    @Test func swiftUIPlacementAndPresentationTypesSelectThroughConditionalValue() {
        let toolbarPlacement = ToolbarItemPlacement.value(ConditionKey<AlwaysTrue>(), .automatic, else: .automatic)
        let commandGroupPlacement = CommandGroupPlacement.value(ConditionKey<AlwaysTrue>(), .toolbar, else: .sidebar)
        let toolbarRole = ToolbarRole.value(ConditionKey<AlwaysTrue>(), .automatic, else: .automatic)
        let navigationVisibility = NavigationSplitViewVisibility.value(ConditionKey<AlwaysTrue>(), .all, else: .detailOnly)
        let presentationDetent = PresentationDetent.value(ConditionKey<AlwaysTrue>(), .large, else: .medium)
        let backgroundInteraction = PresentationBackgroundInteraction.value(ConditionKey<AlwaysTrue>(), .enabled, else: .disabled)

        _ = toolbarPlacement
        _ = commandGroupPlacement
        _ = toolbarRole
        _ = navigationVisibility
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

    @MainActor
    @Test func toolbarContentConditionalCompiles() {
        let toolbar = ToolbarItemGroup(placement: .automatic) {
        }
        .conditional(ConditionKey<AlwaysTrue>()) { content in
            content
        } else: { content in
            content
        }

        _ = toolbar
    }

    @MainActor
    @Test func commandsConditionalCompiles() {
        let commands = CommandMenu("File") {
        }
        .conditional(ConditionKey<AlwaysTrue>()) { content in
            content
        } else: { content in
            content
        }

        _ = commands
    }

    @MainActor
    @Test func sceneConditionalCompiles() {
        let scene = WindowGroup {
            Text("Content")
        }
        .conditional(ConditionKey<AlwaysTrue>()) { content in
            content
        } else: { content in
            content
        }

        _ = scene
    }

    @MainActor
    @Test func tabContentConditionalCompilesWhenAvailable() {
        if #available(macOS 15.0, *) {
            let tab = TabSection {
                Tab("One", systemImage: "1.circle", value: 1) {
                    Text("One")
                }
            }
            .conditional(ConditionKey<AlwaysTrue>()) { content in
                content
            } else: { content in
                content
            }

            _ = tab
        }
    }

    @Test func wwdc25AliasExists() {
        let alias: ConditionKey<WWDC25> = .wwdc25
        _ = alias
    }

    @Test func platformAliasesCompile() {
        let ios13: ConditionKey<iOS13> = .iOS13
        let mac10_15: ConditionKey<macOS10_15> = .macOS10_15
        let tv13: ConditionKey<TVOS13> = .tvOS13
        let watch6: ConditionKey<WatchOS6> = .watchOS6
        let linux: ConditionKey<Linux> = .linux
        let windows: ConditionKey<Windows> = .windows
        let ios14: ConditionKey<iOS14> = .iOS14
        let mac11: ConditionKey<macOS11> = .macOS11
        let tv14: ConditionKey<TVOS14> = .tvOS14
        let watch7: ConditionKey<WatchOS7> = .watchOS7
        let ios15: ConditionKey<iOS15> = .iOS15
        let mac12: ConditionKey<macOS12> = .macOS12
        let tv15: ConditionKey<TVOS15> = .tvOS15
        let watch8: ConditionKey<WatchOS8> = .watchOS8
        let ios16: ConditionKey<iOS16> = .iOS16
        let mac13: ConditionKey<macOS13> = .macOS13
        let tv16: ConditionKey<TVOS16> = .tvOS16
        let watch9: ConditionKey<WatchOS9> = .watchOS9
        let ios17: ConditionKey<iOS17> = .iOS17
        let mac14: ConditionKey<macOS14> = .macOS14
        let tv17: ConditionKey<TVOS17> = .tvOS17
        let watch10: ConditionKey<WatchOS10> = .watchOS10
        let vision1: ConditionKey<VisionOS1> = .visionOS1
        let wwdc24: ConditionKey<WWDC24> = .wwdc24
        let ios18: ConditionKey<iOS18> = .iOS18
        let mac15: ConditionKey<macOS15> = .macOS15
        let tv18: ConditionKey<TVOS18> = .tvOS18
        let watch11: ConditionKey<WatchOS11> = .watchOS11
        let vision2: ConditionKey<VisionOS2> = .visionOS2
        let wwdc25: ConditionKey<WWDC25> = .wwdc25
        let ios26: ConditionKey<iOS26> = .iOS26
        let mac26: ConditionKey<macOS26> = .macOS26
        let tv26: ConditionKey<TVOS26> = .tvOS26
        let watch26: ConditionKey<WatchOS26> = .watchOS26
        let vision26: ConditionKey<VisionOS26> = .visionOS26
        let wwdc26: ConditionKey<WWDC26> = .wwdc26
        let ios27: ConditionKey<iOS27> = .iOS27
        let mac27: ConditionKey<macOS27> = .macOS27
        let tv27: ConditionKey<TVOS27> = .tvOS27
        let watch27: ConditionKey<WatchOS27> = .watchOS27
        let vision27: ConditionKey<VisionOS27> = .visionOS27

        _ = ios13
        _ = mac10_15
        _ = tv13
        _ = watch6
        _ = linux
        _ = windows
        _ = ios14
        _ = mac11
        _ = tv14
        _ = watch7
        _ = ios15
        _ = mac12
        _ = tv15
        _ = watch8
        _ = ios16
        _ = mac13
        _ = tv16
        _ = watch9
        _ = ios17
        _ = mac14
        _ = tv17
        _ = watch10
        _ = vision1
        _ = wwdc24
        _ = ios18
        _ = mac15
        _ = tv18
        _ = watch11
        _ = vision2
        _ = wwdc25
        _ = ios26
        _ = mac26
        _ = tv26
        _ = watch26
        _ = vision26
        _ = wwdc26
        _ = ios27
        _ = mac27
        _ = tv27
        _ = watch27
        _ = vision27
    }
}
