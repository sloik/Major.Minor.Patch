import Foundation

extension Semantic {

    public struct Identifier: Comparable {
        public static func < (lhs: Semantic.Identifier, rhs: Semantic.Identifier) -> Bool {
            lhs.value < rhs.value
        }

        let value: String

        public init?(string: String) {

            guard
                isValidIdentifier(string)
            else {
                return nil
            }

            self.value = string
        }
    }
}

public extension Semantic.Identifier {
    static var alpha: Self { .init(string: "alpha")! }
    static var beta: Self { .init(string: "beta")! }
}

extension [Semantic.Identifier]: Comparable {

    public static func < (lhs: [Element], rhs: [Element]) -> Bool {

        let lefts = lhs.map(\.value).joined(separator: ".")
        let rihts = rhs.map(\.value).joined(separator: ".")

        return lefts < rihts
    }

}
