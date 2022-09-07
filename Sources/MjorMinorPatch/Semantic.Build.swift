//
//  File.swift
//  
//
//  Created by Edward Maliniak on 07/09/2022.
//

import Foundation

extension Semantic {

    public struct Build: Comparable {

        public static func < (lhs: Semantic.Build, rhs: Semantic.Build) -> Bool {
            lhs.value < rhs.value
        }

        let value: String
    }
}
