
import Foundation

import XCTest
@testable import MajorMinorPatch

/// Tests for https://semver.org/
final class SemanticVersioningSpecificationTests: XCTestCase {


    /// Test for: https://semver.org/#spec-item-11
    /// Precedence is determined by the first difference when comparing each of these
    /// identifiers from left to right as follows:
    /// Major, minor, and patch versions are always compared numerically.
    /// Example: 1.0.0 < 2.0.0 < 2.1.0 < 2.1.1.
    func test_verVer_comparison() {

        // Arrange
        let ver_2_0_0 = Semantic.v(ver: .init(major: 2, minor: 0, patch: 0) )
        let ver_2_1_0 = Semantic.v(ver: .init(major: 2, minor: 1, patch: 0) )
        let ver_2_1_1 = Semantic.v(ver: .init(major: 2, minor: 1, patch: 1) )


        // Act & Assert
        XCTAssert( Semantic.ver_0_0_0 < Semantic.ver_1_0_0 )
        XCTAssert( Semantic.ver_0_0_0 < ver_2_0_0 )
        XCTAssert( Semantic.ver_0_0_0 < ver_2_1_0 )
        XCTAssert( Semantic.ver_0_0_0 < ver_2_1_1 )
        XCTAssert( Semantic.ver_1_0_0 < ver_2_0_0 )
        XCTAssert( Semantic.ver_1_0_0 < ver_2_1_0 )
        XCTAssert( Semantic.ver_1_0_0 < ver_2_1_1 )

        XCTAssert( ver_2_0_0 < ver_2_1_0 )
        XCTAssert( ver_2_0_0 < ver_2_1_1 )
        XCTAssert( ver_2_1_0 < ver_2_1_1 )

        XCTAssertFalse( Semantic.ver_1_0_0 < Semantic.ver_1_0_0 )
        XCTAssertFalse( ver_2_0_0 < Semantic.ver_1_0_0 )
        XCTAssertFalse( ver_2_0_0 < ver_2_0_0 )
        XCTAssertFalse( ver_2_1_0 < Semantic.ver_1_0_0 )
        XCTAssertFalse( ver_2_1_0 < ver_2_0_0 )
        XCTAssertFalse( ver_2_1_0 < ver_2_1_0 )
        XCTAssertFalse( ver_2_1_1 < Semantic.ver_1_0_0 )
        XCTAssertFalse( ver_2_1_1 < ver_2_0_0 )
        XCTAssertFalse( ver_2_1_1 < ver_2_1_0 )
        XCTAssertFalse( ver_2_1_1 < ver_2_1_1 )

        XCTAssertFalse( Semantic.ver_0_0_0 > Semantic.ver_1_0_0 )
        XCTAssertFalse( Semantic.ver_0_0_0 > ver_2_0_0 )
        XCTAssertFalse( Semantic.ver_0_0_0 > ver_2_1_0 )
        XCTAssertFalse( Semantic.ver_0_0_0 > ver_2_1_1 )
    }
    
}
