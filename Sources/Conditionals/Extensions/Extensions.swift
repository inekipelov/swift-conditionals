#if canImport(Foundation)
import Foundation
#endif

/// Availability gate for any app extension bundle.
public struct AppExtension: Condition {
    /// Evaluates whether the current bundle is an extension bundle.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if canImport(Foundation)
        if extensionPointIdentifier() != nil {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

/// Identifies a specific `NSExtensionPointIdentifier` value.
public protocol ExtensionPointIdentifier {
    /// The App Extension point identifier stored in the bundle Info.plist.
    static var identifier: String { get }
}

/// Availability gate for a specific extension point.
public struct ExtensionPoint<Identifier: ExtensionPointIdentifier>: Condition {
    /// Evaluates whether the current bundle matches the expected extension point.
    public static func perform<Value>(
        _ then: () -> Value,
        else: () -> Value
    ) -> Value {
        #if canImport(Foundation)
        if extensionPointIdentifier() == Identifier.identifier {
            then()
        } else {
            `else`()
        }
        #else
        `else`()
        #endif
    }
}

private func extensionPointIdentifier() -> String? {
    #if canImport(Foundation)
    let info = Bundle.main.infoDictionary
    let extensionInfo = info?["NSExtension"] as? [String: Any]
    return extensionInfo?["NSExtensionPointIdentifier"] as? String
    #else
    return nil
    #endif
}

public enum KeyboardExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.keyboard-service"
}

public enum ShareExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.share-services"
}

public enum WidgetExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.widgetkit-extension"
}

public enum iMessageExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.message-payload-provider"
}

public enum IntentsExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.intents-service"
}

public enum IntentsUIExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.intents-ui-service"
}

public enum AppIntentsExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.appintents-extension"
}

public enum FileProviderExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.fileprovider-nonui"
}

public enum FileProviderUIExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.fileprovider-actionsui"
}

public enum ActionExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.action-extension"
}

public enum PhotoEditingExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.photo-editing"
}

public enum PhotoProjectExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.photo-project"
}

public enum FinderSyncExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.finder.sync"
}

public enum SafariExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.Safari.extension"
}

public enum MessageFilterExtensionPoint: ExtensionPointIdentifier {
    public static let identifier = "com.apple.identitylookup.message-filter"
}

public extension ConditionKey where C == AppExtension {
    static var appExtension: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<KeyboardExtensionPoint> {
    static var keyboard: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<ShareExtensionPoint> {
    static var share: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<WidgetExtensionPoint> {
    static var widget: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<iMessageExtensionPoint> {
    static var iMessage: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<IntentsExtensionPoint> {
    static var intents: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<IntentsUIExtensionPoint> {
    static var intentsUI: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<AppIntentsExtensionPoint> {
    static var appIntents: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<FileProviderExtensionPoint> {
    static var fileProvider: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<FileProviderUIExtensionPoint> {
    static var fileProviderUI: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<ActionExtensionPoint> {
    static var action: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<PhotoEditingExtensionPoint> {
    static var photoEditing: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<PhotoProjectExtensionPoint> {
    static var photoProject: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<FinderSyncExtensionPoint> {
    static var finderSync: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<SafariExtensionPoint> {
    static var safari: Self { Self() }
}

public extension ConditionKey where C == ExtensionPoint<MessageFilterExtensionPoint> {
    static var messageFilter: Self { Self() }
}
