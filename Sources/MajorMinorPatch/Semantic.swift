
import Foundation

public enum Semantic {

    case v(ver: Version)

    case vi(ver: Version, ids: [Identifier])

    case vb(ver: Version, build: [Build])

    case vib(ver: Version, ids: [Identifier], build: [Build])

}

// MARK: - Comparable

extension Semantic: Comparable, Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case ( .v(let lv), .v(let rv) ):
            print("🛤", #function, #line)
            return lv == rv

        case ( .vi(let lv, let li),  .vi(let rv, let ri) ):
            print("🛤", #function, #line)
            return lv == rv && li == ri

        case ( .vb(let lv, _), .vb(ver: let rv, _) ):
            print("🛤", #function, #line)
            return lv == rv

        case ( .vib(let lv, let li, _), .vib(let rv, let ri, _)):
            print("🛤", #function, #line)
            return lv == rv && li == ri

        default:
            print("🛤", #function, #line)
            return false
        }
    }

    public static func < (lhs: Semantic, rhs: Semantic) -> Bool {

        switch (lhs, rhs) {

        case ( .v(let lv), .v(let rv) ):
            print("🛤", #function, #line)
            return lv < rv

        case ( .v(let lv), .vi(let rv, _) ):
            print("🛤", #function, #line)
            return lv < rv

        case ( .vi, .v ):
            return true

        case ( .vi(let lv, let li),  .vi(let rv, let ri) ):
            print("🛤", #function, #line)

            if lv == rv {
                return li < ri
            }

            return lv < rv

        /// Build metadata MUST be ignored when determining version precedence.
        /// Thus two versions that differ only in the build metadata,
        /// have the same precedence
        case ( .vib(let lv, let li, _), .vib(let rv, let ri, _)):
            return Semantic.vi(ver: lv, ids: li) < Semantic.vi(ver: rv, ids: ri)
            
        default:
            print("🛤", #function, #line)
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
