
extension Semantic {

    public struct Identifier: Comparable {
        public static func < (lhs: Semantic.Identifier, rhs: Semantic.Identifier) -> Bool {
            lhs.value < rhs.value
        }

        let value: String
    }
}
