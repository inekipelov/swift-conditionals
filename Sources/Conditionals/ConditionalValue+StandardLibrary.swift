import Foundation

#if canImport(CoreGraphics)
import CoreGraphics
#endif

extension Bool: ConditionalValue {}
extension String: ConditionalValue {}

extension Int: ConditionalValue {}
extension Int8: ConditionalValue {}
extension Int16: ConditionalValue {}
extension Int32: ConditionalValue {}
extension Int64: ConditionalValue {}

extension UInt: ConditionalValue {}
extension UInt8: ConditionalValue {}
extension UInt16: ConditionalValue {}
extension UInt32: ConditionalValue {}
extension UInt64: ConditionalValue {}

extension Float: ConditionalValue {}
extension Double: ConditionalValue {}

#if canImport(CoreGraphics)
extension CGFloat: ConditionalValue {}
#endif

extension Optional: ConditionalValue {}
extension Array: ConditionalValue {}
extension Dictionary: ConditionalValue {}
extension Set: ConditionalValue {}
