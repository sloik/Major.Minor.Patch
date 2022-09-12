
import Foundation

extension Semantic {

    public struct Metadata: Comparable {

        public static func < (lhs: Semantic.Metadata, rhs: Semantic.Metadata) -> Bool {
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

extension Semantic.Metadata: LosslessStringConvertible {

    public var description: String {
        value
    }

    public init?(_ description: String) {
        do {
            self = try Self.parser.parse(description[...])
        } catch {
            return nil
        }
    }
}
