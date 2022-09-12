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

    func test_version_printing() throws {

        XCTAssertEqual( ver_2_1_1.version.description, "2.1.1" )
        XCTAssertEqual(
            Semantic.Version( ver_2_1_1.version.description ),
            ver_2_1_1.version
        )

        XCTAssertEqual( ver_2_1_0.version.description, "2.1.0" )
        XCTAssertEqual(
            Semantic.Version( ver_2_1_0.version.description ),
            ver_2_1_0.version
        )

        XCTAssertEqual( ver_2_0_0.version.description, "2.0.0" )
        XCTAssertEqual(
            Semantic.Version( ver_2_0_0.version.description ),
            ver_2_0_0.version
        )

        XCTAssertEqual( ver_0_0_0.version.description, "0.0.0" )
        XCTAssertEqual(
            Semantic.Version( ver_0_0_0.version.description ),
            ver_0_0_0.version
        )
    }

    func test_identifier_printing() {

        XCTAssertEqual(ver_2_1_1_alpha.identifiers?.first?.description, "alpha")
        XCTAssertEqual(
            Semantic.Identifier("alpha"),
            .alpha
        )

    }

    func test_metadata_printing() {

        XCTAssertEqual(ver_0_0_0_b1.metadata?.first?.description, "1")
        XCTAssertEqual(
            Semantic.Metadata("exp"),
            .init(string: "exp")
        )
    }

}
