@testable import CGUtils
import XCTest

class CGRectExtensionsTests: XCTestCase {
  func testAspectFitWithEqualRectsReturnsSameRect() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let targetRect = CGRect(x: 0, y: 0, width: 100, height: 100)

    // When
    let resultRect = rect.aspectFit(in: targetRect)

    // Then
    XCTAssertEqual(resultRect, targetRect)
  }

  func testAspectFitWhenRatiosAreEqualReturnsSameRatioRect() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let targetRect = CGRect(x: 0, y: 0, width: 50, height: 50)

    // When
    let resultRect = rect.aspectFit(in: targetRect)

    // Then
    let expectedRect = CGRect(x: 0, y: 0, width: 50, height: 50)
    XCTAssertEqual(resultRect, expectedRect)
  }

  func testAspectFitWithTwoToOneRectReturnsExpectedRect_1() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let targetRect = CGRect(x: 0, y: 0, width: 200, height: 100)

    // When
    let resultRect = rect.aspectFit(in: targetRect)

    // Then
    let expectedRect = CGRect(x: 50, y: 0, width: 100, height: 100)
    XCTAssertEqual(resultRect, expectedRect)
  }

  func testAspectFitWithTwoToOneRectReturnsExpectedRect_2() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let targetRect = CGRect(x: 0, y: 0, width: 100, height: 200)

    // When
    let resultRect = rect.aspectFit(in: targetRect)

    // Then
    let expectedRect = CGRect(x: 00, y: 50, width: 100, height: 100)
    XCTAssertEqual(resultRect, expectedRect)
  }

  func testAspectFillWithEqualRectsReturnsSameRect() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let targetRect = CGRect(x: 0, y: 0, width: 100, height: 100)

    // When
    let resultRect = rect.aspectFill(in: targetRect)

    // Then
    XCTAssertEqual(resultRect, targetRect)
  }

  func testAspectFillWhenRatiosAreEqualReturnsSameRatioRect() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let targetRect = CGRect(x: 0, y: 0, width: 50, height: 50)

    // When
    let resultRect = rect.aspectFill(in: targetRect)

    // Then
    let expectedRect = CGRect(x: 0, y: 0, width: 50, height: 50)
    XCTAssertEqual(resultRect, expectedRect)
  }

  func testAspectFillWithTwoToOneRectReturnsExpectedRect_1() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let targetRect = CGRect(x: 0, y: 0, width: 200, height: 100)

    // When
    let resultRect = rect.aspectFill(in: targetRect)

    // Then
    let expectedRect = CGRect(x: 0, y: -50, width: 200, height: 200)
    XCTAssertEqual(resultRect, expectedRect)
  }

  func testAspectFillWithTwoToOneRectReturnsExpectedRect_2() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let targetRect = CGRect(x: 0, y: 0, width: 100, height: 200)

    // When
    let resultRect = rect.aspectFill(in: targetRect)

    // Then
    let expectedRect = CGRect(x: -50, y: 0, width: 200, height: 200)
    XCTAssertEqual(resultRect, expectedRect)
  }
}
