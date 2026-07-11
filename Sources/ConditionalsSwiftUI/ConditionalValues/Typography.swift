#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font.Design: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font.Weight: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Font.TextStyle: ConditionalValue {}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
extension Font.Leading: ConditionalValue {}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
extension Font.Width: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension TextAlignment: ConditionalValue {}

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Text.TruncationMode: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension DynamicTypeSize: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension SubmitLabel: ConditionalValue {}
#endif
