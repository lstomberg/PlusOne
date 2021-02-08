//
//  String.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation

extension String {
    
    static func randomNumeric(ofLength length: Int) -> String {
        var retval: [String] = []
        for _ in 0..<length {
            let digit = Int.random(in: 0...9)
            retval.append(String(digit))
        }
        return retval.joined()
    }
}
