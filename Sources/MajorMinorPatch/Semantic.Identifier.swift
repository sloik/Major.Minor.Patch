
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
