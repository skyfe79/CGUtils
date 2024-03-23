import XCTest
@testable import CGUtils

class CGRectRectWithAspectRatio: XCTestCase {
  func testRectWithAspectRatio_1() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    // When
    let resultRect = rect.rect(with: CGSize(width: 1, height: 1))
    
    // Then
    XCTAssertEqual(rect, resultRect)
  }

  func testRectWithAspectRatio_2() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    // When
    let resultRect = rect.rect(with: CGSize(width: 1, height: 2))
    
    // Then
    let expectedRect = CGRect(x: 0, y: 0, width: 50, height: 100)
    XCTAssertEqual(resultRect, expectedRect)
  }

  func testRectWithAspectRatio_3() {
    // Given
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    // When
    let resultRect = rect.rect(with: CGSize(width: 4, height: 1))
    
    // Then
    let expectedRect = CGRect(x: 0, y: 0, width: 100, height: 25)
    XCTAssertEqual(resultRect, expectedRect)
  }
}