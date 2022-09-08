
import Foundation

extension Semantic {

    public struct Version {
        let major: Major
        let minor: Minor
        let patch: Patch
    }

}

extension Semantic.Version: AdditiveArithmetic {

    public static var zero: Semantic.Version {
        .init(major: .zero, minor: .zero, patch: .zero)
    }

    public static func + (lhs: Semantic.Version, rhs: Semantic.Version) -> Semantic.Version {
        .init(
            major: lhs.major + rhs.major,
            minor: lhs.minor + rhs.minor,
            patch: lhs.patch + rhs.patch
        )
    }

    public static func - (lhs: Semantic.Version, rhs: Semantic.Version) -> Semantic.Version {
        .init(
            major: lhs.major - rhs.major,
            minor: lhs.minor - rhs.minor,
            patch: lhs.patch - rhs.patch
        )
    }
}
