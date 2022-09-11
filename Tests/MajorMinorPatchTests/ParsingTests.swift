
import Foundation
import XCTest

@testable import MajorMinorPatch

final class ParsingTests: XCTestCase {


    func test_parseString() {

        // Arrange

        let testCaseData: [ParsingTestCaseData] = [

            // just version
            newCase()
                .setInput( "1.0.0")
                .setExpected( .v(ver: .init(major: 1, minor: 0, patch: 0)) ),
            newCase()
                .setInput( "1.0.1")
                .setExpected( .v(ver: .init(major: 1, minor: 0, patch: 1)) ),
            newCase()
                .setInput( "1.1.0")
                .setExpected( .v(ver: .init(major: 1, minor: 1, patch: 0)) ),
            newCase()
                .setInput( "1.1.1")
                .setExpected( .v(ver: .init(major: 1, minor: 1, patch: 1)) ),

            // version and identifiers
            newCase()
                .setInput( "1.0.0-alpha")
                .setExpected( .vi(ver: ver_1_0_0.version, ids: [.alpha]) ),
            newCase()
                .setInput( "1.0.0-beta")
                .setExpected( .vi(ver: ver_1_0_0.version, ids: [.beta]) ),
            newCase()
                .setInput( "1.0.0-alpha.beta")
                .setExpected( .vi(ver: ver_1_0_0.version, ids: [.alpha, .beta]) ),
            newCase()
                .setInput( "1.0.0-alpha.1")
                .setExpected(
                    .vi(
                        ver: ver_1_0_0.version,
                        ids: [.alpha, .init(string: "1")!]
                    )
                ),
            newCase()
                .setInput( "1.0.0-0.3.7")
                .setExpected(
                    .vi(
                        ver: ver_1_0_0.version,
                        ids: [.init(string: "0")!, .init(string: "3")!, .init(string: "7")!]
                    )
                ),

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
