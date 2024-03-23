import Foundation
import CoreGraphics
import QuartzCore

public extension CGAffineTransform {
  /// Returns a CGAffineTransform that transforms the source rectangle to fit within the target rectangle using aspect fit.
  ///
  /// - Parameters:
  ///   - sourceRect: The source rectangle to transform.
  ///   - fitTargetRect: The target rectangle to fit the source rectangle into.
  /// - Returns: A CGAffineTransform that transforms the source rectangle to fit within the target rectangle using aspect fit.
  static func transform(by sourceRect: CGRect, aspectFitInRect fitTargetRect: CGRect) -> CGAffineTransform {
    let fitRect = sourceRect.aspectFit(in: fitTargetRect)
    let xRatio = fitRect.size.width / sourceRect.size.width
    let yRatio = fitRect.size.height / sourceRect.size.height
    return CGAffineTransform(
      translationX: fitRect.origin.x - sourceRect.origin.x * xRatio,
      y: fitRect.origin.y - sourceRect.origin.y * yRatio
    ).scaledBy(x: xRatio, y: yRatio)
  }
  
  /// Returns a CGAffineTransform that scales and centers the source rectangle to fit within the target rectangle while maintaining the aspect ratio.
  ///
  /// - Parameters:
  ///   - size: The size of the source rectangle.
  ///   - fitSize: The size of the target rectangle.
  /// - Returns: A CGAffineTransform that scales and centers the source rectangle to fit within the target rectangle.
  static func transform(by size: CGSize, aspectFitInSize fitSize: CGSize) -> CGAffineTransform {
    let sourceRect = CGRect(origin: .zero, size: size)
    let fitTargetRect = CGRect(origin: .zero, size: fitSize)
    return transform(by: sourceRect, aspectFitInRect: fitTargetRect)
  }
  
  /// Returns a CGAffineTransform that transforms the source rectangle to fit the fill target rectangle using the aspect fill mode.
  ///
  /// - Parameters:
  ///   - sourceRect: The source rectangle to transform.
  ///   - fillTargetRect: The fill target rectangle to fit the source rectangle into.
  /// - Returns: A CGAffineTransform that transforms the source rectangle to fit the fill target rectangle.
  static func transform(by sourceRect: CGRect, aspectFillRect fillTargetRect: CGRect) -> CGAffineTransform {
    let fillRect = sourceRect.aspectFill(in: fillTargetRect)
    let xRatio = fillRect.size.width / sourceRect.size.width
    let yRatio = fillRect.size.height / sourceRect.size.height
    return CGAffineTransform(
      translationX: fillRect.origin.x - sourceRect.origin.x * xRatio,
      y: fillRect.origin.y - sourceRect.origin.y * yRatio
    ).scaledBy(x: xRatio, y: yRatio)
  }
  
  /// Returns a CGAffineTransform that scales and centers the source rectangle to fit the fill target rectangle.
  ///
  /// - Parameters:
  ///   - size: The size of the source rectangle.
  ///   - fillSize: The size of the fill target rectangle.
  /// - Returns: A CGAffineTransform that scales and centers the source rectangle to fit the fill target rectangle.
  static func transform(by size: CGSize, aspectFillSize fillSize: CGSize) -> CGAffineTransform {
    let sourceRect = CGRect(origin: .zero, size: size)
    let fillTargetRect = CGRect(origin: .zero, size: fillSize)
    return transform(by: sourceRect, aspectFillRect: fillTargetRect)
  }
}

public extension CGAffineTransform {
  /// Returns the rotation angle in radians of the affine transform.
  var rotationRadians: CGFloat {
    return atan2(b, a)
  }

  /// The rotation angle in degrees.
  var rotationAngle: CGFloat {
    return rotationRadians * 180 / .pi
  }

  /**
   Returns the scale factor along the x-axis of the affine transform.
   
   The scale factor is calculated by taking the square root of the product of the `a` and `c` components of the affine transform matrix.
   
   - Returns: The scale factor along the x-axis.
   */
  var scaleX: CGFloat {
    return sqrt(a * a + c * c)
  }

  /// Returns the scale factor along the y-axis of the affine transform.
  ///
  /// - Returns: The scale factor along the y-axis.
  var scaleY: CGFloat {
    return sqrt(b * b + d * d)
  }

  /**
   Returns the scale factors of the affine transform as a CGPoint.
   
   - Returns: A CGPoint representing the scale factors of the affine transform.
   */
  var scaleXY: CGPoint {
    return CGPoint(x: scaleX, y: scaleY)
  }

  /// The translation value in the x-axis of the affine transform.
  var translationX: CGFloat {
    return tx
  }

  /// Returns the translation value in the Y-axis of the affine transform.
  var translationY: CGFloat {
    return ty
  }

  /**
   Returns the translation of the affine transform as a CGPoint.
   
   - Returns: The translation of the affine transform as a CGPoint.
   */
  var translation: CGPoint {
    return CGPoint(x: translationX, y: translationY)
  }
}

public extension CATransform3D {
  /// Applies a perspective effect to the affine transform.
  ///
  /// - Parameters:
  ///   - cameraDistance: The distance of the camera from the object.
  ///
  /// - Note: This method modifies the `m34` property of the affine transform to create a perspective effect.
  ///
  /// - Important: The `m34` property must be set to a non-zero value to enable perspective transformations.
  ///
  /// - SeeAlso: `CATransform3D`
  func perpective(cameraDistance: CGFloat) {
    guard cameraDistance != 0 else {
      return
    }
    var transform = self
    transform.m34 = 1.0 / -cameraDistance
  }
}