
import Foundation

extension Semantic {

    public struct Patch: Comparable {

        public static func < (lhs: Semantic.Patch, rhs: Semantic.Patch) -> Bool {
            lhs.value < rhs.value
        }

        let value: UInt
    }
}

//MARK: - Increment Decrement

extension Semantic.Patch {

    /// Returns incremented version of `Path`. Is self is at max value than returns copy.
    var incremented: Semantic.Patch {
        
        if value == UInt.max {
            return self
        }

        return .init(value: self.value + 1)
    }

    /// Returns decremented version of `Path`. Is self is at min value than returns copy.
    var decremented: Semantic.Patch {

        if value == UInt.min {
            return self
        }

        return .init(value: value - 1)
    }

}
