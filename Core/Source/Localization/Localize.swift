//
//  Localize.swift
//  Core
//
//  Created by Corbin Montague on 5/18/21.
//

import Foundation

public protocol Localize {
    func string(forKey key: String, comment: String) -> String
}
