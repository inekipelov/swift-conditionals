#if os(iOS) || targetEnvironment(macCatalyst)
import Dispatch
import Foundation
import UIKit

func currentUserInterfaceIdiom() -> UIUserInterfaceIdiom {
    if Thread.isMainThread {
        return MainActor.assumeIsolated {
            UIDevice.current.userInterfaceIdiom
        }
    }

    return DispatchQueue.main.sync {
        MainActor.assumeIsolated {
            UIDevice.current.userInterfaceIdiom
        }
    }
}
#endif
