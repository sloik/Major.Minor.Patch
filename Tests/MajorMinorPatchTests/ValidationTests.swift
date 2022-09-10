
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

        
        // Numeric identifiers MUST NOT include leading zeroes,
        // so alphanumeric may contain them.
        XCTAssertTrue( isValidIdentifier("0alpha") )
        XCTAssertTrue( isValidIdentifier("00alpha") )
        XCTAssertTrue( isValidIdentifier("000alpha") )
        XCTAssertTrue( isValidIdentifier("a0") )
        XCTAssertTrue( isValidIdentifier("00a") )
        XCTAssertTrue( isValidIdentifier("0b00") )
        XCTAssertTrue( isValidIdentifier("0c1") )
        XCTAssertTrue( isValidIdentifier("00d1") )
        XCTAssertTrue( isValidIdentifier("g0g0g0g1g") )


        // Invalid
        XCTAssertFalse( isValidIdentifier("") )
        XCTAssertFalse( isValidIdentifier("0") )
        XCTAssertFalse( isValidIdentifier("00") )
        XCTAssertFalse( isValidIdentifier("000") )
        XCTAssertFalse( isValidIdentifier("01") )
        XCTAssertFalse( isValidIdentifier("001") )
        XCTAssertFalse( isValidIdentifier("0001") )
        XCTAssertFalse( isValidIdentifier("043724730237454032759234750932") )
    }
}
