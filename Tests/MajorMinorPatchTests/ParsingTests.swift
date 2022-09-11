
import Foundation
import XCTest

@testable import MajorMinorPatch

final class ParsingTests: XCTestCase {


    func test_parseString() {

        // Arrange

        let testCaseData: [ParsingTestCaseData] = [

            newCase()
                .setInput( "1.0.0")
                .setExpected( .v(ver: .init(major: 1, minor: 0, patch: 0)) ),

        ]

        // Act & Assert

        testCaseData.forEach { test in

            let result = parse(string: test.input)

            XCTAssertNotNil(
                result,
                "Did not parse string: \"\(test.input)\"",
                file: test.file,
                line: test.line
            )

            if let result {
                XCTAssertEqual(
                    result,
                    test.expected,
                    file: test.file,
                    line: test.line
                )
            }
        }
    }
}

fileprivate func newCase(file: StaticString = #file, line: UInt = #line) -> ParsingTestCaseData {
    .init(file: file, line: line, input: "", expected: ver_0_0_0)
}

fileprivate typealias PTC = ParsingTestCaseData

fileprivate struct ParsingTestCaseData {

    let file: StaticString
    let line: UInt

    let input: String
    let expected: Semantic

    func setInput(_ string: String) -> Self {
        .init(
            file: file,
            line: line,
            input: string,
            expected: expected
        )
    }

    func setExpected(_ version: Semantic) -> Self {
        .init(
            file: file,
            line: line,
            input: input,
            expected: version
        )
    }
}
