//
//  NameDiscribable.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

protocol NameDiscribable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension NameDiscribable {
    var typeName: String {
        return String(describing: type(of: self))
    }
    
    static var typeName: String {
        return String(describing: self)
    }
}

extension NSObject: NameDiscribable {}
