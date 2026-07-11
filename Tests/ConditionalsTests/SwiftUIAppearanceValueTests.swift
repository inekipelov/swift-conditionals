#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Appearance Values")
struct SwiftUIAppearanceValueTests {
    @Test func environmentAppearanceValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let colorScheme = ColorScheme.value(condition, .dark, else: .light)
        let contrast = ColorSchemeContrast.value(condition, .increased, else: .standard)
        let legibility = LegibilityWeight.value(condition, .bold, else: .regular)

        _ = colorScheme
        _ = contrast
        _ = legibility
    }

    @Test func concreteAppearanceValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let color = Color.value(condition, .red, else: .blue)
        let fallbackColor = Color.value(ConditionKey<AlwaysFalse>(), .red, else: .blue)
        let gradient = Gradient.value(
            condition,
            Gradient(colors: [.red, .blue]),
            else: Gradient(colors: [.blue, .red])
        )
        let linear = LinearGradient.value(
            condition,
            LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing),
            else: LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing)
        )
        let radial = RadialGradient.value(
            condition,
            RadialGradient(colors: [.red, .blue], center: .center, startRadius: 0, endRadius: 20),
            else: RadialGradient(colors: [.blue, .red], center: .center, startRadius: 0, endRadius: 20)
        )
        let angular = AngularGradient.value(
            condition,
            AngularGradient(colors: [.red, .blue], center: .center),
            else: AngularGradient(colors: [.blue, .red], center: .center)
        )

        #expect(color == .red)
        #expect(fallbackColor == .blue)
        _ = gradient
        _ = linear
        _ = radial
        _ = angular
    }

    @Test func modernAppearanceValuesCompileWhenAvailable() {
        if #available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *) {
            let condition = ConditionKey<AlwaysTrue>()
            let elliptical = EllipticalGradient.value(
                condition,
                EllipticalGradient(colors: [.red, .blue]),
                else: EllipticalGradient(colors: [.blue, .red])
            )
            _ = elliptical
        }

        if #available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 10.0, *) {
            let material = Material.value(ConditionKey<AlwaysTrue>(), .thin, else: .regular)
            _ = material
        }
    }
}
#endif
