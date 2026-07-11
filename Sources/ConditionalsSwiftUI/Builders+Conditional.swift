#if canImport(SwiftUI)
import SwiftUI
@_exported import Conditionals

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *)
public extension ToolbarContent {
    /// Applies `then` when the condition is `true`; otherwise returns the original toolbar content.
    @ToolbarContentBuilder
    @inlinable
    func conditional<C: Condition, Modified: ToolbarContent>(
        _ condition: ConditionKey<C>,
        @ToolbarContentBuilder then thenContent: @MainActor (Self) -> Modified
    ) -> some ToolbarContent {
        if condition.isSatisfied {
            thenContent(self)
        } else {
            self
        }
    }

    /// Applies one of two toolbar transforms based on the condition.
    @ToolbarContentBuilder
    @inlinable
    func conditional<C: Condition, Then: ToolbarContent, Else: ToolbarContent>(
        _ condition: ConditionKey<C>,
        @ToolbarContentBuilder then thenContent: @MainActor (Self) -> Then,
        @ToolbarContentBuilder else elseContent: @MainActor (Self) -> Else
    ) -> some ToolbarContent {
        if condition.isSatisfied {
            thenContent(self)
        } else {
            elseContent(self)
        }
    }
}

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension TabContent {
    /// Applies `then` when the condition is `true`; otherwise returns the original tab content.
    @TabContentBuilder<TabValue>
    @inlinable
    func conditional<C: Condition, Modified: TabContent<TabValue>>(
        _ condition: ConditionKey<C>,
        @TabContentBuilder<TabValue> then thenContent: @MainActor (Self) -> Modified
    ) -> some TabContent<TabValue> {
        if condition.isSatisfied {
            thenContent(self)
        } else {
            self
        }
    }

    /// Applies one of two tab transforms based on the condition.
    @TabContentBuilder<TabValue>
    @inlinable
    func conditional<C: Condition, Then: TabContent<TabValue>, Else: TabContent<TabValue>>(
        _ condition: ConditionKey<C>,
        @TabContentBuilder<TabValue> then thenContent: @MainActor (Self) -> Then,
        @TabContentBuilder<TabValue> else elseContent: @MainActor (Self) -> Else
    ) -> some TabContent<TabValue> {
        if condition.isSatisfied {
            thenContent(self)
        } else {
            elseContent(self)
        }
    }
}

@available(iOS 16.0, macCatalyst 16.0, macOS 13.0, visionOS 1.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public extension Commands {
    /// Applies `then` when the condition is `true`; otherwise returns the original command hierarchy.
    @CommandsBuilder
    @inlinable
    func conditional<C: Condition, Modified: Commands>(
        _ condition: ConditionKey<C>,
        @CommandsBuilder then thenContent: @MainActor (Self) -> Modified
    ) -> some Commands {
        if condition.isSatisfied {
            thenContent(self)
        } else {
            self
        }
    }

    /// Applies one of two command transforms based on the condition.
    @CommandsBuilder
    @inlinable
    func conditional<C: Condition, Then: Commands, Else: Commands>(
        _ condition: ConditionKey<C>,
        @CommandsBuilder then thenContent: @MainActor (Self) -> Then,
        @CommandsBuilder else elseContent: @MainActor (Self) -> Else
    ) -> some Commands {
        if condition.isSatisfied {
            thenContent(self)
        } else {
            elseContent(self)
        }
    }
}

@available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *)
public extension Scene {
    /// Applies `then` when the condition is `true`; otherwise returns the original scene.
    @inlinable
    func conditional<C: Condition>(
        _ condition: ConditionKey<C>,
        then thenContent: @MainActor (Self) -> Self
    ) -> Self {
        condition.isSatisfied ? thenContent(self) : self
    }

    /// Applies one of two scene transforms based on the condition.
    @inlinable
    func conditional<C: Condition>(
        _ condition: ConditionKey<C>,
        then thenContent: @MainActor (Self) -> Self,
        else elseContent: @MainActor (Self) -> Self
    ) -> Self {
        condition.isSatisfied ? thenContent(self) : elseContent(self)
    }
}
#endif
