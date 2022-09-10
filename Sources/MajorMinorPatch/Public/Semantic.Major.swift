
import Foundation

extension Semantic {

    public struct Major: ExpressibleByIntegerLiteral, RawRepresentable {

        public let rawValue: UInt

        public init(integerLiteral value: UInt) {
            self.rawValue = value
        }

        public init?(rawValue: UInt) {
            self.rawValue = rawValue
        }

        public init(_ value: UInt) {
            self.rawValue = value
        }
    }
}

// MARK: - Comparable

extension Semantic.Major: Comparable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    public static func <= (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue <= rhs.rawValue
    }

    public static func >= (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue >= rhs.rawValue
    }

    public static func > (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue > rhs.rawValue
    }
}

// MARK: - Common

extension Semantic.Major {

    static public var one: Semantic.Major { 1 }

    static public var max: Semantic.Major {
        .init(integerLiteral: .max)
    }

    static public var min: Semantic.Major {
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

// MARK: -- Pattern

public func ~= (pattern: Semantic.Major, value: Semantic.Major) -> Bool {
    pattern.rawValue == value.rawValue
}

public func ~= (pattern: UInt, value: Semantic.Major) -> Bool {
    pattern == value.rawValue
}

//MARK: - AdditiveArithmetic

extension Semantic.Major: AdditiveArithmetic {

    static public var zero: Semantic.Major { 0 }

    public static func - (lhs: Semantic.Major, rhs: Semantic.Major) -> Semantic.Major {
        .init(integerLiteral: lhs.rawValue - rhs.rawValue)
    }

    public static func + (lhs: Semantic.Major, rhs: Semantic.Major) -> Semantic.Major {
        .init(integerLiteral: lhs.rawValue + rhs.rawValue)
    }

}

// MARK: - Incrementation Decrementation

extension Semantic.Major {
    /// Returns incremented version of `Major`. Is self is at max value than returns copy.
    var incremented: Semantic.Major {
        isMax ? self : self + .one
    }

    /// Returns decremented version of `Major`. Is self is at min value than returns copy.
    var decremented: Semantic.Major {
        isMin ? self : self - .one
    }
}

// MARK: -
