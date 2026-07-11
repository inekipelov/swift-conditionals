import Testing
@testable import Conditionals

@Suite("Platform and Extension")
struct PlatformAndExtensionTests {
    @Test func basePlatformAliasesCompile() {
        let ios: ConditionKey<iOS> = .iOS
        let macOSPlatform: ConditionKey<macOS> = .macOS
        let tvOSPlatform: ConditionKey<tvOS> = .tvOS
        let watchOSPlatform: ConditionKey<watchOS> = .watchOS
        let visionOSPlatform: ConditionKey<visionOS> = .visionOS
        let iPhonePlatform: ConditionKey<iPhone> = .iPhone
        let iPadPlatform: ConditionKey<iPad> = .iPad
        let linux: ConditionKey<Linux> = .linux
        let windows: ConditionKey<Windows> = .windows

        _ = ios
        _ = macOSPlatform
        _ = tvOSPlatform
        _ = watchOSPlatform
        _ = visionOSPlatform
        _ = iPhonePlatform
        _ = iPadPlatform
        _ = linux
        _ = windows
    }

    @Test func versionedPlatformAliasesCompile() {
        let ios13: ConditionKey<iOS13> = .iOS13
        let mac10_15: ConditionKey<macOS10_15> = .macOS10_15
        let tv13: ConditionKey<TVOS13> = .tvOS13
        let watch6: ConditionKey<WatchOS6> = .watchOS6
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
        let ios18: ConditionKey<iOS18> = .iOS18
        let mac15: ConditionKey<macOS15> = .macOS15
        let tv18: ConditionKey<TVOS18> = .tvOS18
        let watch11: ConditionKey<WatchOS11> = .watchOS11
        let vision2: ConditionKey<VisionOS2> = .visionOS2
        let ios26: ConditionKey<iOS26> = .iOS26
        let mac26: ConditionKey<macOS26> = .macOS26
        let tv26: ConditionKey<TVOS26> = .tvOS26
        let watch26: ConditionKey<WatchOS26> = .watchOS26
        let vision26: ConditionKey<VisionOS26> = .visionOS26
        let ios27: ConditionKey<iOS27> = .iOS27
        let mac27: ConditionKey<macOS27> = .macOS27
        let tv27: ConditionKey<TVOS27> = .tvOS27
        let watch27: ConditionKey<WatchOS27> = .watchOS27
        let vision27: ConditionKey<VisionOS27> = .visionOS27

        _ = ios13
        _ = mac10_15
        _ = tv13
        _ = watch6
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
        _ = ios18
        _ = mac15
        _ = tv18
        _ = watch11
        _ = vision2
        _ = ios26
        _ = mac26
        _ = tv26
        _ = watch26
        _ = vision26
        _ = ios27
        _ = mac27
        _ = tv27
        _ = watch27
        _ = vision27
    }

    @Test func wwdcAliasesCompile() {
        let wwdc19: ConditionKey<WWDC19> = .wwdc19
        let wwdc20: ConditionKey<WWDC20> = .wwdc20
        let wwdc21: ConditionKey<WWDC21> = .wwdc21
        let wwdc22: ConditionKey<WWDC22> = .wwdc22
        let wwdc23: ConditionKey<WWDC23> = .wwdc23
        let wwdc24: ConditionKey<WWDC24> = .wwdc24
        let wwdc25: ConditionKey<WWDC25> = .wwdc25
        let wwdc26: ConditionKey<WWDC26> = .wwdc26

        _ = wwdc19
        _ = wwdc20
        _ = wwdc21
        _ = wwdc22
        _ = wwdc23
        _ = wwdc24
        _ = wwdc25
        _ = wwdc26
    }

    @Test func extensionAliasesCompile() {
        let appExtension: ConditionKey<AppExtension> = .appExtension
        let keyboardExtension: ConditionKey<ExtensionPoint<KeyboardExtensionPoint>> = .keyboard
        let shareExtension: ConditionKey<ExtensionPoint<ShareExtensionPoint>> = .share
        let widgetExtension: ConditionKey<ExtensionPoint<WidgetExtensionPoint>> = .widget
        let messageExtension: ConditionKey<ExtensionPoint<iMessageExtensionPoint>> = .iMessage
        let intentsExtension: ConditionKey<ExtensionPoint<IntentsExtensionPoint>> = .intents
        let intentsUIExtension: ConditionKey<ExtensionPoint<IntentsUIExtensionPoint>> = .intentsUI
        let appIntentsExtension: ConditionKey<ExtensionPoint<AppIntentsExtensionPoint>> = .appIntents
        let fileProviderExtension: ConditionKey<ExtensionPoint<FileProviderExtensionPoint>> = .fileProvider
        let fileProviderUIExtension: ConditionKey<ExtensionPoint<FileProviderUIExtensionPoint>> = .fileProviderUI
        let actionExtension: ConditionKey<ExtensionPoint<ActionExtensionPoint>> = .action
        let photoEditingExtension: ConditionKey<ExtensionPoint<PhotoEditingExtensionPoint>> = .photoEditing
        let photoProjectExtension: ConditionKey<ExtensionPoint<PhotoProjectExtensionPoint>> = .photoProject
        let finderSyncExtension: ConditionKey<ExtensionPoint<FinderSyncExtensionPoint>> = .finderSync
        let safariExtension: ConditionKey<ExtensionPoint<SafariExtensionPoint>> = .safari
        let messageFilterExtension: ConditionKey<ExtensionPoint<MessageFilterExtensionPoint>> = .messageFilter

        #expect(!appExtension.isSatisfied)
        _ = keyboardExtension
        _ = shareExtension
        _ = widgetExtension
        _ = messageExtension
        _ = intentsExtension
        _ = intentsUIExtension
        _ = appIntentsExtension
        _ = fileProviderExtension
        _ = fileProviderUIExtension
        _ = actionExtension
        _ = photoEditingExtension
        _ = photoProjectExtension
        _ = finderSyncExtension
        _ = safariExtension
        _ = messageFilterExtension
    }
}
