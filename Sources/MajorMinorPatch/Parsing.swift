
import Foundation
import Parsing

extension Semantic.Major {

    static var parser: AnyParser<Substring, Semantic.Major> {
        Parse( Semantic.Major.init(integerLiteral:) ) {
            UInt.parser(of: Substring.self, radix: 10)
        }
        .eraseToAnyParser()
    }
}

extension Semantic.Minor {

    static var parser: AnyParser<Substring, Semantic.Minor> {
        Parse( Semantic.Minor.init(integerLiteral:) ) {
            UInt.parser(of: Substring.self, radix: 10)
        }
        .eraseToAnyParser()
    }
}

extension Semantic.Patch {

    static var parser: AnyParser<Substring, Semantic.Patch> {
        Parse( Semantic.Patch.init(integerLiteral:) ) {
            UInt.parser(of: Substring.self, radix: 10)
        }
        .eraseToAnyParser()
    }
}

extension Semantic.Version {

    static var parser: AnyParser<Substring, Semantic.Version> {

        Parse( Semantic.Version.init(major:minor:patch:) ) {
            Semantic.Major.parser
            "."
            Semantic.Minor.parser
            "."
            Semantic.Patch.parser
        }
        .eraseToAnyParser()
    }
}

extension Semantic {
    static var parser: AnyParser<Substring, Semantic> {
        OneOf {
            Semantic.Version.parser
        }.map { (v: Version) in
            Semantic.v(ver: v)
        }
        .eraseToAnyParser()
    }
}


func parse(string: String) -> Semantic? {

    let semVer: Semantic?

    do {
        semVer = try Semantic.parser.parse(string)
    } catch {
        print("🛤 Unable to parse to version!")
        semVer = .none
    }

    return semVer
}
