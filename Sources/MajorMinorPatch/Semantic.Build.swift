
import Foundation

extension Semantic {

    public struct Build: Comparable {

        public static func < (lhs: Semantic.Build, rhs: Semantic.Build) -> Bool {
            lhs.value < rhs.value
        }

        let value: String

        public init?(string: String) {

            guard
                isValidBuildIdentifier(string)
            else {
                return nil
            }

            self.value = string
        }
    }
}
