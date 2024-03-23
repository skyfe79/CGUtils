import XCTest
@testable import CGUtils

class CGRectRectWithAspectRatioInsideRect: XCTestCase {
  func testRectWithAspectRatioInsideRect_1() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let insideRect = CGRect(x: 0, y: 0, width: 100, height: 100)
    // When
    let resultRect = rect.rect(with: CGSize(width: 1, height: 1), insideRect: insideRect)
    
    // Then
    XCTAssertEqual(rect, resultRect)
  }

  func testRectWithAspectRatioInsideRect_2() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let insideRect = CGRect(x: 0, y: 0, width: 100, height: 100)
 
    // When
    let resultRect = rect.rect(with: CGSize(width: 1, height: 2), insideRect: insideRect)
    
    // Then
    let expectedRect = CGRect(x: 25, y: 0, width: 50, height: 100)
    XCTAssertEqual(resultRect, expectedRect)
  }

  func testRectWithAspectRatioInsideRect_3() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    let insideRect = CGRect(x: 0, y: 0, width: 100, height: 100)
 
    // When
    let resultRect = rect.rect(with: CGSize(width: 4, height: 1), insideRect: insideRect)
    
    // Then
    let expectedRect = CGRect(x: 0, y: 37.5, width: 100, height: 25)
    XCTAssertEqual(resultRect, expectedRect)
  }
}