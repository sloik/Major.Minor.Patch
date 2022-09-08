import XCTest
@testable import MjorMinorPatch

final class MinorTests: XCTestCase {

    func test_equatable() {
        XCTAssertEqual   ( Semantic.Minor.one , 1 )
        XCTAssertNotEqual( Semantic.Minor.one , 0 )

        XCTAssert( Semantic.Minor.zero < .one )
        XCTAssert( Semantic.Minor.max  > .one )
    }

    func test_isZero() {
        XCTAssertTrue ( Semantic.Minor.zero.isZero )
        XCTAssertFalse( Semantic.Minor.one.isZero )
    }

    func test_isMin() {
        XCTAssertTrue ( Semantic.Minor.min.isMin )
        XCTAssertFalse( Semantic.Minor.one.isMin )
    }

    func test_isMax() {
        XCTAssertTrue ( Semantic.Minor.max.isMax )
        XCTAssertFalse( Semantic.Minor.one.isMax )
    }

    func test_increment() {

        XCTAssertEqual(
            Semantic.Minor.max.incremented,
            Semantic.Minor.max,
            "Incrementing max value should return the same value!"
        )

        XCTAssertEqual(
            Semantic.Minor.zero.incremented,
            Semantic.Minor.one,
            "Incrementing zero should return one!"
        )
    }

    func test_decremented() {

        XCTAssertEqual(
            Semantic.Minor.min.decremented,
            Semantic.Minor.min,
            "Decrementing min value should return the same value!"
        )

        XCTAssertEqual(
            Semantic.Minor.one.decremented,
            Semantic.Minor.zero,
            "Decrementing one should return zero!"
        )
    }

    func test_additive() {

        XCTAssertEqual(
            one + two,
            three,
            "1 + 2 != 3"
        )

        XCTAssertEqual(
            three - two,
            one,
            "3 - 2 != 1"
        )
    }
}

fileprivate let zero  = Semantic.Minor(integerLiteral: 0)
fileprivate let one   = Semantic.Minor(integerLiteral: 1)
fileprivate let two   = Semantic.Minor(integerLiteral: 2)
fileprivate let three = Semantic.Minor(integerLiteral: 3)
