
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

        let leftCount = lhs.count
        let rightCount = rhs.count

        if leftCount == rightCount {
            return false
        }

        return leftCount < rightCount
    }

}
