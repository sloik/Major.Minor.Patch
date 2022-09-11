import Foundation
import XCTest

@testable import MajorMinorPatch

final class PrintingTests: XCTestCase {

    func test_major_printing() {
        XCTAssertEqual(
            try Semantic.Major.printer.print(.init(42)),
            "42"
        )
    }

    func test_minor_printing() {
        XCTAssertEqual(
            try Semantic.Minor.printer.print(.init(42)),
            "42"
        )
    }

    func test_patch_printing() {
        XCTAssertEqual(
            try Semantic.Patch.printer.print(.init(42)),
            "42"
        )
    }

}
