import Foundation

#if canImport(CoreGraphics)
import CoreGraphics
#endif

/// Boolean values support conditional selection.
extension Bool: ConditionalValue {}
/// String values support conditional selection.
extension String: ConditionalValue {}

/// Integer values support conditional selection.
extension Int: ConditionalValue {}
/// Integer values support conditional selection.
extension Int8: ConditionalValue {}
/// Integer values support conditional selection.
extension Int16: ConditionalValue {}
/// Integer values support conditional selection.
extension Int32: ConditionalValue {}
/// Integer values support conditional selection.
extension Int64: ConditionalValue {}

/// Unsigned integer values support conditional selection.
extension UInt: ConditionalValue {}
/// Unsigned integer values support conditional selection.
extension UInt8: ConditionalValue {}
/// Unsigned integer values support conditional selection.
extension UInt16: ConditionalValue {}
/// Unsigned integer values support conditional selection.
extension UInt32: ConditionalValue {}
/// Unsigned integer values support conditional selection.
extension UInt64: ConditionalValue {}

/// Floating-point values support conditional selection.
extension Float: ConditionalValue {}
/// Floating-point values support conditional selection.
extension Double: ConditionalValue {}

#if canImport(CoreGraphics)
/// CoreGraphics scalars support conditional selection.
extension CGFloat: ConditionalValue {}
#endif

/// Optional values support conditional selection.
extension Optional: ConditionalValue {}
/// Array values support conditional selection.
extension Array: ConditionalValue {}
/// Dictionary values support conditional selection.
extension Dictionary: ConditionalValue {}
/// Set values support conditional selection.
extension Set: ConditionalValue {}
