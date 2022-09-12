
import Foundation

public enum Semantic {

    /// Contains ony version.
    case v(ver: Version)

    /// Contains version and identifiers.
    case vi(ver: Version, ids: [Identifier])

    /// Contains version and build metadata.
    case vb(ver: Version, build: [Metadata])

    /// Contains version, identifiers and build metadata.
    case vib(ver: Version, ids: [Identifier], build: [Metadata])
}

// MARK: - Comparable

extension Semantic: Comparable, Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case ( .v, .v ):
            return lhs.version == rhs.version

        case ( .vi, .vi):
            return lhs.version == rhs.version && lhs.identifiers! == rhs.identifiers!

        case ( .vb, .vb ):
            return lhs.version == rhs.version

        case ( .vib, .vib):
            return lhs.version == rhs.version && lhs.identifiers! == rhs.identifiers!

        default:
            return false
        }
    }

    public static func < (lhs: Semantic, rhs: Semantic) -> Bool {

        switch (lhs, rhs) {

        case ( .v, .v ):
            return lhs.version < rhs.version

        case ( .v, .vi ):
            return lhs.version < rhs.version

        case ( .vi, .v ):
            return true

        case ( .vi,  .vi ):
            return lhs.version == rhs.version
                ? lhs.identifiers! < rhs.identifiers!
                : lhs.version < rhs.version

        /// Build metadata MUST be ignored when determining version precedence.
        /// Thus two versions that differ only in the build metadata,
        /// have the same precedence
        case ( .vib(let lv, let li, _), .vib(let rv, let ri, _)):
            return Semantic.vi(ver: lv, ids: li) < Semantic.vi(ver: rv, ids: ri)
            
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

    var identifiers: [Identifier]? {
        switch self {
        case .vi(_, let ids):
            return ids.isEmpty ? .none : ids

        case .vib(_, let ids, _):
            return ids.isEmpty ? .none : ids

        default:
            return .none
        }
    }

    var metadata: [Metadata]? {
        switch self {
        case .vb(_, let build):
            return build
        case .vib(_, _, let build):
            return build

        default:
            return .none
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

// MARK: - LosslessStringConvertible

extension Semantic: LosslessStringConvertible {

    public var description: String {
        switch self {

        case .v(let ver):
            return ver.description

        case .vi(let ver, let ids):
            let idsString: String = ids.map( \.description ).joined(separator: ".")
            return ver.description + "-" + idsString

        case .vb(let ver, let build):
            let metadataString: String = build.map( \.description ).joined(separator: ".")
            return ver.description + "+" + metadataString

        case .vib(let ver, let ids, let build):
            let idsString: String = ids.map( \.description ).joined(separator: ".")
            let metadataString: String = build.map( \.description ).joined(separator: ".")

            return ver.description + "-" + idsString + "+" + metadataString
        }
    }

    public init?(_ description: String) {
        do {
            self = try Self.parser.parse(description[...])
        } catch {
            return nil
        }
    }
}
