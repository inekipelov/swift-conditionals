#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macCatalyst 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
extension Animation: ConditionalValue {}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
extension RedactionReasons: ConditionalValue {}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
extension ScenePhase: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 10.15, tvOS 15.0, visionOS 1.0, watchOS 9.0, *)
extension ControlSize: ConditionalValue {}

@available(iOS 15.0, macCatalyst 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *)
extension Visibility: ConditionalValue {}

#if os(iOS) || os(tvOS) || os(visionOS) || targetEnvironment(macCatalyst)
@available(iOS 13.0, macCatalyst 13.0, tvOS 13.0, visionOS 1.0, *)
extension EditMode: ConditionalValue {}
#endif
#endif
