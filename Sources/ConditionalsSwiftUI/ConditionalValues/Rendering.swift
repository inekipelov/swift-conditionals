#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension BlendMode: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 11.0, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Image.Scale: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension FillStyle: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension StrokeStyle: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension RoundedCornerStyle: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension SymbolRenderingMode: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension SymbolVariants: ConditionalValue {}
#endif
