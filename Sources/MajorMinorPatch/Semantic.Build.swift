
import Foundation

extension Semantic {

    public struct Build: Comparable {

        public static func < (lhs: Semantic.Build, rhs: Semantic.Build) -> Bool {
            lhs.value < rhs.value
        }

        let value: String
    }
}
