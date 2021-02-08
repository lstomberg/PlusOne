//
//  Store.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation

enum Store { }

extension Store {
    
    static private let ScoreKey = "Score"
    
    static var score: Int {
        get {
            UserDefaults.standard.integer(forKey: ScoreKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: ScoreKey)
        }
    }
}

