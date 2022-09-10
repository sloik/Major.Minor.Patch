
import Foundation
import XCTest

@testable import MajorMinorPatch

final class ValidationTests: XCTestCase {

    func test_isValidIdentifier() {

        // Valid
        XCTAssertTrue( isValidIdentifier("-") )

        XCTAssertTrue( isValidIdentifier("10alpha") )
        XCTAssertTrue( isValidIdentifier("200alpha") )
        XCTAssertTrue( isValidIdentifier("3000alpha") )
        XCTAssertTrue( isValidIdentifier("43724730237454032759234750932") )


        // Invalid
        XCTAssertFalse( isValidIdentifier("") )

        XCTAssertFalse( isValidIdentifier("0alpha") )
        XCTAssertFalse( isValidIdentifier("00alpha") )
        XCTAssertFalse( isValidIdentifier("000alpha") )
        XCTAssertFalse( isValidIdentifier("043724730237454032759234750932") )
    }
}
