import CoreGraphics
import Foundation

/// An extension for CGSize providing utility methods.
public extension CGSize {
  /// Calculates the size that maintains the aspect ratio of the current size and fits within the given size.
  ///
  /// - Parameters:
  ///   - size: The size to fit within.
  /// - Returns: The size that maintains the aspect ratio and fits within the given size.
  func aspectFit(in size: CGSize) -> CGSize {
    let scale = min(size.width / width, size.height / height)
    return CGSize(width: width * scale, height: height * scale)
  }

  /// Calculates the size that maintains the aspect ratio of the current size and fills the given size.
  /// - Parameters:
  ///   - size: The size to fill.
  /// - Returns: The calculated size that maintains the aspect ratio and fills the given size.
  func aspectFill(in size: CGSize) -> CGSize {
    let scale = max(size.width / width, size.height / height)
    return CGSize(width: width * scale, height: height * scale)
  }
}
