import CoreGraphics
import Foundation

public extension CGRect {
  /// Calculates the CGRect that fits within the given rect while maintaining the aspect ratio of the original CGRect.
  ///
  /// - Parameters:
  ///   - rect: The CGRect to fit the original CGRect into.
  /// - Returns: The fitted CGRect.
  func aspectFit(in rect: CGRect) -> CGRect {
    let size = self.size.aspectFit(in: rect.size)
    let x = rect.origin.x + (rect.size.width - size.width) / 2
    let y = rect.origin.y + (rect.size.height - size.height) / 2
    let origin = CGPoint(x: x, y: y)
    return CGRect(origin: origin, size: size)
  }

  /// Calculates the CGRect that fits the receiver's aspect ratio within the given CGRect.
  ///
  /// - Parameters:
  ///   - rect: The CGRect in which the receiver's aspect ratio should fit.
  /// - Returns: The CGRect that fits the receiver's aspect ratio within the given CGRect.
  func aspectFill(in rect: CGRect) -> CGRect {
    let size = self.size.aspectFill(in: rect.size)
    let x = rect.origin.x + (rect.size.width - size.width) / 2
    let y = rect.origin.y + (rect.size.height - size.height) / 2
    let origin = CGPoint(x: x, y: y)
    return CGRect(origin: origin, size: size)
  }

  /// Returns a new CGRect with the specified aspect ratio.
  ///
  /// - Parameter aspectRatio: The desired aspect ratio for the new CGRect.
  /// - Returns: A new CGRect with the specified aspect ratio.
  func rect(with aspectRatio: CGSize) -> CGRect {
    let width = size.width
    let height = size.height

    let targetWidth = aspectRatio.width
    let targetHeight = aspectRatio.height

    let widthRatio = width / targetWidth
    let heightRatio = height / targetHeight

    let ratio = min(widthRatio, heightRatio)

    let newWidth = targetWidth * ratio
    let newHeight = targetHeight * ratio

    let newX = origin.x
    let newY = origin.y

    return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
  }

  /// Calculates a new CGRect with the specified aspect ratio that fits inside the given CGRect.
  ///
  /// - Parameters:
  ///   - aspectRatio: The aspect ratio (width and height) of the desired rectangle.
  ///   - insideRect: The CGRect in which the new rectangle should fit.
  /// - Returns: A new CGRect with the specified aspect ratio that fits inside the given CGRect.
  func rect(with aspectRatio: CGSize, insideRect: CGRect) -> CGRect {
    let width = insideRect.width
    let height = insideRect.height

    let targetWidth = aspectRatio.width
    let targetHeight = aspectRatio.height

    let widthRatio = width / targetWidth
    let heightRatio = height / targetHeight

    let ratio = min(widthRatio, heightRatio)

    let newWidth = targetWidth * ratio
    let newHeight = targetHeight * ratio

    let newX = insideRect.origin.x + (width - newWidth) / 2
    let newY = insideRect.origin.y + (height - newHeight) / 2

    return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
  }
}
