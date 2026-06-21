import XCTest
import SwiftUI
@testable import Conditionals
@testable import ConditionalsSwiftUI

final class ConditionalsTests: XCTestCase {
    func testCaseIsTrueWithAlwaysTrueCondition() {
        XCTAssertTrue(ConditionKey<AlwaysTrue>().isSatisfied)
    }

    func testCaseIsTrueWithAlwaysFalseCondition() {
        XCTAssertFalse(ConditionKey<AlwaysFalse>().isSatisfied)
    }

    func testNotAlwaysTrueIsFalse() {
        XCTAssertFalse(ConditionKey<Not<AlwaysTrue>>().isSatisfied)
    }

    func testNotAlwaysFalseIsTrue() {
        XCTAssertTrue(ConditionKey<Not<AlwaysFalse>>().isSatisfied)
    }

    func testAnyOfAlwaysFalseAndAlwaysTrueIsTrue() {
        XCTAssertTrue(ConditionKey<AnyOf<AlwaysFalse, AlwaysTrue>>().isSatisfied)
    }

    func testAnyOfAlwaysFalseAndAlwaysFalseIsFalse() {
        XCTAssertFalse(ConditionKey<AnyOf<AlwaysFalse, AlwaysFalse>>().isSatisfied)
    }

    func testAllOfAlwaysTrueAndAlwaysTrueIsTrue() {
        XCTAssertTrue(ConditionKey<AllOf<AlwaysTrue, AlwaysTrue>>().isSatisfied)
    }

    func testAllOfAlwaysTrueAndAlwaysFalseIsFalse() {
        XCTAssertFalse(ConditionKey<AllOf<AlwaysTrue, AlwaysFalse>>().isSatisfied)
    }

    func testConditionalValueSelectsThenBranchForTrueCondition() {
        let value = Int.value(ConditionKey<AlwaysTrue>(), 1, else: 2)
        XCTAssertEqual(value, 1)
    }

    func testConditionalValueSelectsElseBranchForFalseCondition() {
        let value = Int.value(ConditionKey<AlwaysFalse>(), 1, else: 2)
        XCTAssertEqual(value, 2)
    }

    func testSwiftUIValueTypesSelectThroughConditionalValue() {
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

        XCTAssertNotNil(Optional(colorScheme))
        XCTAssertNotNil(Optional(colorSchemeContrast))
        XCTAssertNotNil(Optional(legibility))
        XCTAssertNotNil(Optional(sizeClass))
        XCTAssertNotNil(Optional(layoutDirection))
        XCTAssertNotNil(Optional(scenePhase))
        XCTAssertNotNil(Optional(controlSize))
        XCTAssertNotNil(Optional(dynamicTypeSize))
        XCTAssertNotNil(Optional(symbolRenderingMode))
        XCTAssertNotNil(Optional(symbolVariants))
        XCTAssertNotNil(Optional(submitLabel))
    }

    func testSwiftUIPlacementAndPresentationTypesSelectThroughConditionalValue() {
        let toolbarPlacement = ToolbarItemPlacement.value(ConditionKey<AlwaysTrue>(), .automatic, else: .automatic)
        let commandGroupPlacement = CommandGroupPlacement.value(ConditionKey<AlwaysTrue>(), .toolbar, else: .sidebar)
        let toolbarRole = ToolbarRole.value(ConditionKey<AlwaysTrue>(), .automatic, else: .automatic)
        let navigationVisibility = NavigationSplitViewVisibility.value(ConditionKey<AlwaysTrue>(), .all, else: .detailOnly)
        let presentationDetent = PresentationDetent.value(ConditionKey<AlwaysTrue>(), .large, else: .medium)
        let backgroundInteraction = PresentationBackgroundInteraction.value(ConditionKey<AlwaysTrue>(), .enabled, else: .disabled)

        XCTAssertNotNil(Optional(toolbarPlacement))
        XCTAssertNotNil(Optional(commandGroupPlacement))
        XCTAssertNotNil(Optional(toolbarRole))
        XCTAssertNotNil(Optional(navigationVisibility))
        XCTAssertNotNil(Optional(presentationDetent))
        XCTAssertNotNil(Optional(backgroundInteraction))
    }

    func testTabPlacementSelectsThroughConditionalValueWhenAvailable() {
        if #available(macOS 15.0, *) {
            let tabPlacement = TabPlacement.value(ConditionKey<AlwaysTrue>(), .pinned, else: .sidebarOnly)
            XCTAssertNotNil(Optional(tabPlacement))
        }
    }

    #if os(iOS) || os(tvOS) || os(visionOS) || targetEnvironment(macCatalyst)
    func testEditModeSelectsThroughConditionalValueWhenAvailable() {
        let editMode = EditMode.value(ConditionKey<AlwaysTrue>(), .active, else: .inactive)
        XCTAssertNotNil(Optional(editMode))
    }
    #endif

    @MainActor
    func testToolbarContentConditionalCompiles() {
        let toolbar = ToolbarItemGroup(placement: .automatic) {
        }
        .conditional(ConditionKey<AlwaysTrue>()) { content in
            content
        } else: { content in
            content
        }

        XCTAssertNotNil(Optional(toolbar))
    }

    @MainActor
    func testCommandsConditionalCompiles() {
        let commands = CommandMenu("File") {
        }
        .conditional(ConditionKey<AlwaysTrue>()) { content in
            content
        } else: { content in
            content
        }

        XCTAssertNotNil(Optional(commands))
    }

    @MainActor
    func testSceneConditionalCompiles() {
        let scene = WindowGroup {
            Text("Content")
        }
        .conditional(ConditionKey<AlwaysTrue>()) { content in
            content
        } else: { content in
            content
        }

        XCTAssertNotNil(Optional(scene))
    }

    @MainActor
    func testTabContentConditionalCompilesWhenAvailable() {
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

            XCTAssertNotNil(Optional(tab))
        }
    }

    func testWWDC25AliasExists() {
        let alias: ConditionKey<WWDC25> = .wwdc25
        XCTAssertNotNil(Optional(alias))
    }

    func test2019PlatformAliasesCompile() {
        let ios: ConditionKey<iOS13> = .iOS13
        let mac: ConditionKey<macOS10_15> = .macOS10_15
        let tv: ConditionKey<TVOS13> = .tvOS13
        let watch: ConditionKey<WatchOS6> = .watchOS6
        XCTAssertNotNil(Optional(ios))
        XCTAssertNotNil(Optional(mac))
        XCTAssertNotNil(Optional(tv))
        XCTAssertNotNil(Optional(watch))
    }

    func test2020PlatformAliasesCompile() {
        let ios: ConditionKey<iOS14> = .iOS14
        let mac: ConditionKey<macOS11> = .macOS11
        let tv: ConditionKey<TVOS14> = .tvOS14
        let watch: ConditionKey<WatchOS7> = .watchOS7
        XCTAssertNotNil(Optional(ios))
        XCTAssertNotNil(Optional(mac))
        XCTAssertNotNil(Optional(tv))
        XCTAssertNotNil(Optional(watch))
    }

    func test2021PlatformAliasesCompile() {
        let ios: ConditionKey<iOS15> = .iOS15
        let mac: ConditionKey<macOS12> = .macOS12
        let tv: ConditionKey<TVOS15> = .tvOS15
        let watch: ConditionKey<WatchOS8> = .watchOS8
        XCTAssertNotNil(Optional(ios))
        XCTAssertNotNil(Optional(mac))
        XCTAssertNotNil(Optional(tv))
        XCTAssertNotNil(Optional(watch))
    }

    func test2022PlatformAliasesCompile() {
        let ios: ConditionKey<iOS16> = .iOS16
        let mac: ConditionKey<macOS13> = .macOS13
        let tv: ConditionKey<TVOS16> = .tvOS16
        let watch: ConditionKey<WatchOS9> = .watchOS9
        XCTAssertNotNil(Optional(ios))
        XCTAssertNotNil(Optional(mac))
        XCTAssertNotNil(Optional(tv))
        XCTAssertNotNil(Optional(watch))
    }

    func test2023PlatformAliasesCompile() {
        let ios: ConditionKey<iOS17> = .iOS17
        let mac: ConditionKey<macOS14> = .macOS14
        let tv: ConditionKey<TVOS17> = .tvOS17
        let watch: ConditionKey<WatchOS10> = .watchOS10
        let vision: ConditionKey<VisionOS1> = .visionOS1
        XCTAssertNotNil(Optional(ios))
        XCTAssertNotNil(Optional(mac))
        XCTAssertNotNil(Optional(tv))
        XCTAssertNotNil(Optional(watch))
        XCTAssertNotNil(Optional(vision))
    }

    func test2024PlatformAliasesCompile() {
        let wwdc: ConditionKey<WWDC24> = .wwdc24
        let ios: ConditionKey<iOS18> = .iOS18
        let mac: ConditionKey<macOS15> = .macOS15
        let tv: ConditionKey<TVOS18> = .tvOS18
        let watch: ConditionKey<WatchOS11> = .watchOS11
        let vision: ConditionKey<VisionOS2> = .visionOS2
        XCTAssertNotNil(Optional(wwdc))
        XCTAssertNotNil(Optional(ios))
        XCTAssertNotNil(Optional(mac))
        XCTAssertNotNil(Optional(tv))
        XCTAssertNotNil(Optional(watch))
        XCTAssertNotNil(Optional(vision))
    }

    func test2025PlatformAliasesCompile() {
        let wwdc: ConditionKey<WWDC25> = .wwdc25
        let ios: ConditionKey<iOS26> = .iOS26
        let mac: ConditionKey<macOS26> = .macOS26
        let tv: ConditionKey<TVOS26> = .tvOS26
        let watch: ConditionKey<WatchOS26> = .watchOS26
        let vision: ConditionKey<VisionOS26> = .visionOS26
        XCTAssertNotNil(Optional(wwdc))
        XCTAssertNotNil(Optional(ios))
        XCTAssertNotNil(Optional(mac))
        XCTAssertNotNil(Optional(tv))
        XCTAssertNotNil(Optional(watch))
        XCTAssertNotNil(Optional(vision))
    }

    func test2026PlatformAliasesCompile() {
        let wwdc: ConditionKey<WWDC26> = .wwdc26
        let ios: ConditionKey<iOS27> = .iOS27
        let mac: ConditionKey<macOS27> = .macOS27
        let tv: ConditionKey<TVOS27> = .tvOS27
        let watch: ConditionKey<WatchOS27> = .watchOS27
        let vision: ConditionKey<VisionOS27> = .visionOS27
        XCTAssertNotNil(Optional(wwdc))
        XCTAssertNotNil(Optional(ios))
        XCTAssertNotNil(Optional(mac))
        XCTAssertNotNil(Optional(tv))
        XCTAssertNotNil(Optional(watch))
        XCTAssertNotNil(Optional(vision))
    }

    private struct AlwaysTrue: Condition {
        static func perform<Value>(_ then: () -> Value, else: () -> Value) -> Value {
            then()
        }
    }

    private struct AlwaysFalse: Condition {
        static func perform<Value>(_ then: () -> Value, else: () -> Value) -> Value {
            `else`()
        }
    }
}
