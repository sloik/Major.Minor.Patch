
import Foundation

extension Semantic {

    public struct Version {

        let major: Major
        let minor: Minor
        let patch: Patch

        public init(
            major: Semantic.Major,
            minor: Semantic.Minor,
            patch: Semantic.Patch
        ) {
            self.major = major
            self.minor = minor
            self.patch = patch
        }
    }

}

extension Semantic.Version: Comparable {

    public static func < (lhs: Semantic.Version, rhs: Semantic.Version) -> Bool {

        if lhs.major < rhs.major  { return true }
        if lhs.minor < rhs.minor  { return true }
        if lhs.patch < rhs.patch  { return true }

        return false
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
