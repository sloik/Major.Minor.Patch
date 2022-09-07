
import Foundation

extension Semantic {

    public struct Minor: Comparable, ExpressibleByIntegerLiteral {

        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.value == rhs.value
        }

        public static func < (lhs: Self, rhs: Self) -> Bool {
            lhs.value < rhs.value
        }

        let value: UInt

        public init(integerLiteral value: UInt) {
            self.value = value
        }
    }
}

// MARK: - Common

extension Semantic.Minor {

    static public var one: Semantic.Minor { 1 }

    static public var max: Semantic.Minor {
        .init(integerLiteral: .max)
    }

    static public var min: Semantic.Minor {
        .init(integerLiteral: .min)
    }

    var isZero: Bool {
        self == .zero
    }

    var isMax: Bool {
        self == .max
    }

    var isMin: Bool {
        self == .min
    }
}

//MARK: - AdditiveArithmetic

extension Semantic.Minor: AdditiveArithmetic {

    static public var zero: Semantic.Minor { 0 }

    public static func - (lhs: Semantic.Minor, rhs: Semantic.Minor) -> Semantic.Minor {
        .init(integerLiteral: lhs.value - rhs.value)
    }

    public static func + (lhs: Semantic.Minor, rhs: Semantic.Minor) -> Semantic.Minor {
        .init(integerLiteral: lhs.value + rhs.value)
    }

}

// MARK: - Incrementation Decrementation

extension Semantic.Minor {
    /// Returns incremented version of `Minor`. Is self is at max value than returns copy.
    var incremented: Semantic.Minor {
        isMax ? self : self + .one
    }

    /// Returns decremented version of `Minor`. Is self is at min value than returns copy.
    var decremented: Semantic.Minor {
        isMin ? self : self - .one
    }
}

// MARK: -
