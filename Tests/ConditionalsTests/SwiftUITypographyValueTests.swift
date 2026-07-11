#if canImport(SwiftUI)
import SwiftUI
import Testing
@testable import Conditionals
@testable import ConditionalsSwiftUI

@Suite("SwiftUI Typography Values")
struct SwiftUITypographyValueTests {
    @Test func typographyValuesCompile() {
        let condition = ConditionKey<AlwaysTrue>()
        let font = Font.value(condition, .title, else: .body)
        let design = Font.Design.value(condition, .rounded, else: .default)
        let weight = Font.Weight.value(condition, .bold, else: .regular)
        let textStyle = Font.TextStyle.value(condition, .headline, else: .body)
        let leading = Font.Leading.value(condition, .tight, else: .loose)
        let alignment = TextAlignment.value(condition, .leading, else: .trailing)
        let truncation = Text.TruncationMode.value(condition, .head, else: .tail)
        let dynamicTypeSize = DynamicTypeSize.value(condition, .xxxLarge, else: .small)
        let submitLabel = SubmitLabel.value(condition, .done, else: .go)

        _ = font
        _ = design
        _ = weight
        _ = textStyle
        _ = leading
        _ = alignment
        _ = truncation
        _ = dynamicTypeSize
        _ = submitLabel
    }

    @Test func fontWidthCompilesWhenAvailable() {
        if #available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *) {
            let width = Font.Width.value(ConditionKey<AlwaysTrue>(), .expanded, else: .standard)
            _ = width
        }
    }
}
#endif
