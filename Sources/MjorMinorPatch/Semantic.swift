
import Foundation

public enum Semantic {

    case v(ver: Version)

    case vi(ver: Version, ids: [Identifier])

    case vb(ver: Version, build: [Build])

    case vib(ver: Version, ids: [Identifier], build: [Build])

}

extension Semantic {

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
