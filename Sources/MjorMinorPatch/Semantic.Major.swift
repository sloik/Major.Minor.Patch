
import Foundation

extension Semantic {
    
    public struct Major: Comparable {

        public static func < (lhs: Semantic.Major, rhs: Semantic.Major) -> Bool {
            lhs.value < rhs.value
        }

        let value: UInt
    }
}

//MARK: - Increment Decrement

extension Semantic.Major {

    /// Returns incremented version of `Major`. Is self is at max value than returns copy.
    var incremented: Semantic.Major {

        if value == UInt.max {
            return self
        }

        return .init(value: self.value + 1)
    }

    /// Returns decremented version of `Major`. Is self is at min value than returns copy.
    var decremented: Semantic.Major {

        if value == UInt.min {
            return self
        }

        return .init(value: value - 1)
    }

}
