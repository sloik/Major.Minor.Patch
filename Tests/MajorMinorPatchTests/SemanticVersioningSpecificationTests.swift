
import Foundation

import XCTest
@testable import MajorMinorPatch

/// Tests for https://semver.org/
final class SemanticVersioningSpecificationTests: XCTestCase {


    /// Test for: https://semver.org/#spec-item-11
    ///
    /// Precedence is determined by the first difference when comparing each of these
    /// identifiers from left to right as follows:
    ///
    /// Major, minor, and patch versions are always compared numerically.
    ///
    /// Example: 1.0.0 < 2.0.0 < 2.1.0 < 2.1.1.
    func test_verVer_comparison() {

        XCTAssert( ver_0_0_0 < ver_1_0_0 )
        XCTAssert( ver_0_0_0 < ver_2_0_0 )
        XCTAssert( ver_0_0_0 < ver_2_1_0 )
        XCTAssert( ver_0_0_0 < ver_2_1_1 )
        XCTAssert( ver_1_0_0 < ver_2_0_0 )
        XCTAssert( ver_1_0_0 < ver_2_1_0 )
        XCTAssert( ver_1_0_0 < ver_2_1_1 )

        XCTAssert( ver_2_0_0 < ver_2_1_0 )
        XCTAssert( ver_2_0_0 < ver_2_1_1 )
        XCTAssert( ver_2_1_0 < ver_2_1_1 )

        XCTAssertFalse( ver_1_0_0 < ver_1_0_0 )
        XCTAssertFalse( ver_2_0_0 < ver_1_0_0 )
        XCTAssertFalse( ver_2_0_0 < ver_2_0_0 )
        XCTAssertFalse( ver_2_1_0 < ver_1_0_0 )
        XCTAssertFalse( ver_2_1_0 < ver_2_0_0 )
        XCTAssertFalse( ver_2_1_0 < ver_2_1_0 )
        XCTAssertFalse( ver_2_1_1 < ver_1_0_0 )
        XCTAssertFalse( ver_2_1_1 < ver_2_0_0 )
        XCTAssertFalse( ver_2_1_1 < ver_2_1_0 )
        XCTAssertFalse( ver_2_1_1 < ver_2_1_1 )

        XCTAssertFalse( ver_0_0_0 > ver_1_0_0 )
        XCTAssertFalse( ver_0_0_0 > ver_2_0_0 )
        XCTAssertFalse( ver_0_0_0 > ver_2_1_0 )
        XCTAssertFalse( ver_0_0_0 > ver_2_1_1 )
    }

    /// When major, minor, and patch are equal, a pre-release version
    /// has lower precedence than a normal version:
    /// Example: 1.0.0-alpha < 1.0.0.
    func test_v_vi_comparison() {

        XCTAssert( ver_0_0_0_alpha < ver_0_0_0 )
        XCTAssert( ver_0_0_0_alpha < ver_1_0_0 )
        XCTAssert( ver_0_0_0_alpha < ver_2_1_0 )
        XCTAssert( ver_0_0_0_alpha < ver_2_1_1 )

        XCTAssert( ver_0_0_0_alpha < ver_0_0_0 )
        XCTAssert( ver_1_0_0_alpha < ver_1_0_0 )
        XCTAssert( ver_2_1_0_alpha < ver_2_1_0 )
        XCTAssert( ver_2_1_1_alpha < ver_2_1_1 )

        XCTAssertFalse( ver_0_0_0_alpha > ver_0_0_0 )
        XCTAssertFalse( ver_1_0_0_alpha > ver_1_0_0 )
        XCTAssertFalse( ver_2_1_0_alpha > ver_2_1_0 )
        XCTAssertFalse( ver_2_1_1_alpha > ver_2_1_1 )
    }

    /// Precedence for two pre-release versions with the same major, minor,
    /// and patch version MUST be determined by comparing each dot separated
    /// identifier from left to right until a difference is found as follows:
    ///
    /// Identifiers consisting of only digits are compared numerically.
    ///
    /// Identifiers with letters or hyphens are compared lexically in ASCII sort order.
    ///
    /// Numeric identifiers always have lower precedence than non-numeric identifiers.
    ///
    /// A larger set of pre-release fields has a higher precedence than a smaller set,
    /// if all of the preceding identifiers are equal.
    ///
    /// Example:
    ///
    /// 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0.
    func test_vi_vi_comparison() {

        XCTAssertFalse( ver_0_0_0_alpha < ver_0_0_0_alpha )
        XCTAssert( ver_0_0_0_alpha < ver_1_0_0_alpha )
        XCTAssert( ver_0_0_0_alpha < ver_2_1_0_alpha )
        XCTAssert( ver_0_0_0_alpha < ver_2_1_1_alpha )

        
    }
}
