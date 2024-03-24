@testable import CGUtils
import XCTest

class CGSizeExtensionsTests: XCTestCase {
  func testAspectFitWithEqualSizesReturnsSameSize() {
    // Given
    let size = CGSize(width: 100, height: 100)
    let targetSize = CGSize(width: 100, height: 100)

    // When
    let resultSize = size.aspectFit(in: targetSize)

    // Then
    XCTAssertEqual(resultSize, targetSize)
  }

  func testAspectFitWhenRatiosAreEqualReturnsSameRatioSize() {
    // Given
    let size = CGSize(width: 100, height: 100)
    let targetSize = CGSize(width: 50, height: 50)

    // When
    let resultSize = size.aspectFit(in: targetSize)

    // Then
    let expectedSize = CGSize(width: 50, height: 50)
    XCTAssertEqual(resultSize, expectedSize)
  }

  func testAspectFitWithTwoToOneSizeReturnsExpectedSize_1() {
    // Given
    let size = CGSize(width: 100, height: 100)
    let targetSize = CGSize(width: 200, height: 100)

    // When
    let resultSize = size.aspectFit(in: targetSize)

    // Then
    let expectedSize = CGSize(width: 100, height: 100)
    XCTAssertEqual(resultSize, expectedSize)
  }

  func testAspectFitWithTwoToOneSizeReturnsExpectedSize_2() {
    // Given
    let size = CGSize(width: 100, height: 100)
    let targetSize = CGSize(width: 100, height: 200)

    // When
    let resultSize = size.aspectFit(in: targetSize)

    // Then
    let expectedSize = CGSize(width: 100, height: 100)
    XCTAssertEqual(resultSize, expectedSize)
  }

  func testAspectFillWithEqualSizesReturnsSameSize() {
    // Given
    let size = CGSize(width: 100, height: 100)
    let targetSize = CGSize(width: 100, height: 100)

    // When
    let resultSize = size.aspectFill(in: targetSize)

    // Then
    XCTAssertEqual(resultSize, targetSize)
  }

  func testAspectFillWhenRatiosAreEqualReturnsSameRatioSize() {
    // Given
    let size = CGSize(width: 100, height: 100)
    let targetSize = CGSize(width: 50, height: 50)

    // When
    let resultSize = size.aspectFill(in: targetSize)

    // Then
    let expectedSize = CGSize(width: 50, height: 50)
    XCTAssertEqual(resultSize, expectedSize)
  }

  func testAspectFillWithTwoToOneSizeReturnsExpectedSize_1() {
    // Given
    let size = CGSize(width: 100, height: 100)
    let targetSize = CGSize(width: 200, height: 100)

    // When
    let resultSize = size.aspectFill(in: targetSize)

    // Then
    let expectedSize = CGSize(width: 200, height: 200)
    XCTAssertEqual(resultSize, expectedSize)
  }

  func testAspectFillWithTwoToOneSizeReturnsExpectedSize_2() {
    // Given
    let size = CGSize(width: 100, height: 100)
    let targetSize = CGSize(width: 100, height: 200)

    // When
    let resultSize = size.aspectFill(in: targetSize)

    // Then
    let expectedSize = CGSize(width: 200, height: 200)
    XCTAssertEqual(resultSize, expectedSize)
  }
}
