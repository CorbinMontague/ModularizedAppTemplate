//
//  Brand.swift
//  Core
//
//  Created by Corbin Montague on 5/18/21.
//

import Foundation

public enum Brand {
    case lightside
    case darkside
    
    public var displayName: String {
        switch self {
        case .lightside:
            return "Lightside"
        case .darkside:
            return "Darkside"
        }
    }
}
