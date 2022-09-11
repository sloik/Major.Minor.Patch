
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

extension Semantic.Identifier {

    static var parser: AnyParser<Substring, Semantic.Identifier> {

        Prefix(
            while: { $0 != "." }
        )
        .map(
            AnyConversion(
                apply: { (sub: Substring) -> Semantic.Identifier? in
                    Semantic.Identifier(string: String(sub))
                },
                unapply: { (identifier: Semantic.Identifier) -> Substring? in
                    identifier.value[...]
                }
            )
        )
        .eraseToAnyParser()
    }
}

var versionParserWithIdentifiers: AnyParser<Substring, Semantic> {

    Parse {
        versionParser
        "-"
        Many {
            Semantic.Identifier.parser
        } separator: {
            "."
        }
    }
    .map { (sem: Semantic, ids: [Semantic.Identifier]) -> Semantic in
        Semantic.vi(ver: sem.version, ids: ids)
    }
    .eraseToAnyParser()
}

var versionParser: AnyParser<Substring, Semantic> {
    Semantic.Version.parser.map( Semantic.v(ver:) ).eraseToAnyParser()
}

extension Semantic {
    static var parser: AnyParser<Substring, Semantic> {
        OneOf {
            versionParserWithIdentifiers
            versionParser
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
