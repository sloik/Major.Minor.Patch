
extension Semantic {

    public struct Identifier: Comparable {
        public static func < (lhs: Semantic.Identifier, rhs: Semantic.Identifier) -> Bool {
            lhs.value < rhs.value
        }

        let value: String
    }
}

public extension Semantic.Identifier {
    static var alpha: Self { .init(value: "alpha") }
    static var beta: Self { .init(value: "beta") }
}

extension [Semantic.Identifier]: Comparable {

    public static func < (lhs: [Element], rhs: [Element]) -> Bool {

        let lefts = lhs.map(\.value).joined(separator: ".")
        let rihts = rhs.map(\.value).joined(separator: ".")

        return lefts < rihts
    }

}
