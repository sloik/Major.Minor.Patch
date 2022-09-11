import Foundation
import XCTest

@testable import MajorMinorPatch

final class PrintingTests: XCTestCase {

    func test_major_printing() throws {

        // Arrange
        let sut = Semantic.Major(42)

        // Act & Assert
        XCTAssertEqual( sut.description, "42" )

        XCTAssertEqual(
            Semantic.Major( sut.description ) ,
            sut
        )
    }

    func test_minor_printing() throws {

        // Arrange
        let sut = Semantic.Minor(42)

        // Act & Assert
        XCTAssertEqual( sut.description, "42" )

        XCTAssertEqual(
            Semantic.Minor( sut.description ) ,
            sut
        )
    }

    func test_patch_printing() throws {

        // Arrange
        let sut = Semantic.Patch(42)

        // Act & Assert
        XCTAssertEqual( sut.description, "42" )

        XCTAssertEqual(
            Semantic.Patch( sut.description ) ,
            sut
        )
    }

}
