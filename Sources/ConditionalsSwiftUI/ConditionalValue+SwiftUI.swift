#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
extension ToolbarItemPlacement: ConditionalValue {}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, visionOS 1.0, *)
extension CommandGroupPlacement: ConditionalValue {}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
extension ToolbarRole: ConditionalValue {}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
extension NavigationSplitViewVisibility: ConditionalValue {}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
extension PresentationDetent: ConditionalValue {}

@available(iOS 16.4, macCatalyst 16.4, macOS 13.3, tvOS 16.4, visionOS 1.0, watchOS 9.4, *)
extension PresentationBackgroundInteraction: ConditionalValue {}

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
extension TabPlacement: ConditionalValue {}

#endif
