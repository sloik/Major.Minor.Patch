
import Foundation

public enum Semantic {

    case v(ver: Version)

    case vi(ver: Version, ids: [Identifier])

    case vb(ver: Version, build: [Build])

    case vib(ver: Version, ids: [Identifier], build: [Build])

}

// MARK: - Comparable

extension Semantic: Comparable {
    public static func < (lhs: Semantic, rhs: Semantic) -> Bool {

        switch (lhs, rhs) {

        case (.v(let lv), .v(let rv)):
            return lv < rv
            
        default:
            return false
        }

    }
}

// MARK: - API

public extension Semantic {

    /// `Version` ignoring any identifiers and build metadata.
    var version: Version {
        switch self {
        case .v(let ver):
            return ver

        case .vi(let ver, _):
            return ver

        case .vb(let ver, _):
            return ver

        case .vib(let ver, _, _):
            return ver
        }
    }

}

// MARK: - Common Versions

public extension Semantic {

    /// 0.0.0
    static var ver_0_0_0: Semantic {
        .v(ver: Version(major: 0, minor: 0, patch: 0))
    }

    /// 1.0.0
    static var ver_1_0_0: Semantic {
        .v(ver: Version(major: 1, minor: 0, patch: 0))
    }
}
