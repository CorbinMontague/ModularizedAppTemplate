//
//  ConcreteLocalize.swift
//  App
//
//  Created by Corbin Montague on 5/18/21.
//

import Core
import Foundation

class ConcreteLocalize: Localize {
    
    // MARK: - Dependencies
    
    private let brand: Brand
    
    // MARK: - Constructor
    
    init(brand: Brand) {
        self.brand = brand
    }
    
    // MARK: - Localize
    
    /// Checks brand specific strings files before checking the shared Localizable.strings.
    /// - Parameters:
    ///   - key: A key associated with a localized string in one of our strings files.
    ///   - comment: A comment that gives devs reading your code some context.
    func string(forKey key: String, comment: String) -> String {
        var value = ""
        
        switch brand {
        case .lightside:
            value = NSLocalizedString(key, tableName: "Lightside", comment: comment)
        case .darkside:
            value = NSLocalizedString(key, tableName: "Darkside", comment: comment)
        }
        
        guard value != key else {
            // There is no brand specific localized string for this key, fallback to the shared Localizable.strings
            return NSLocalizedString(key, comment: comment)
        }
        return value
    }
}
