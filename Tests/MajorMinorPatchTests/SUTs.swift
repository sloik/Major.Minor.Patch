
import Foundation
import MajorMinorPatch


let ver_0_0_0 = Semantic.ver_0_0_0
let ver_1_0_0 = Semantic.ver_1_0_0

let ver_2_0_0 = Semantic.v(ver: .init(major: 2, minor: 0, patch: 0) )
let ver_2_1_0 = Semantic.v(ver: .init(major: 2, minor: 1, patch: 0) )
let ver_2_1_1 = Semantic.v(ver: .init(major: 2, minor: 1, patch: 1) )

let minor0 = Semantic.Minor(integerLiteral: 0)
let minor1 = Semantic.Minor(integerLiteral: 1)
let minor2 = Semantic.Minor(integerLiteral: 2)
let minor3 = Semantic.Minor(integerLiteral: 3)