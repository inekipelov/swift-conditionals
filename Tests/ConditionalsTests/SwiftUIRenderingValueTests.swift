#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Rendering Values")
struct SwiftUIRenderingValueTests {
    @Test func renderingValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let blendMode = BlendMode.value(condition, .normal, else: .multiply)
        let fillStyle = FillStyle.value(
            condition,
            FillStyle(eoFill: false, antialiased: true),
            else: FillStyle(eoFill: true, antialiased: false)
        )
        let strokeStyle = StrokeStyle.value(
            condition,
            StrokeStyle(lineWidth: 1),
            else: StrokeStyle(lineWidth: 2)
        )
        let cornerStyle = RoundedCornerStyle.value(condition, .circular, else: .continuous)
        let symbolMode = SymbolRenderingMode.value(condition, .palette, else: .monochrome)
        let symbolVariants = SymbolVariants.value(condition, .fill, else: .none)

        _ = blendMode
        _ = fillStyle
        _ = strokeStyle
        _ = cornerStyle
        _ = symbolMode
        _ = symbolVariants
    }

    @Test func imageScaleCompilesWhenAvailable() {
        if #available(iOS 13.0, macCatalyst 13.0, macOS 11.0, tvOS 13.0, visionOS 1.0, watchOS 6.0, *) {
            let scale = Image.Scale.value(ConditionKey<AlwaysTrue>(), .small, else: .large)
            _ = scale
        }
    }
}
#endif
