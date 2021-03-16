//
//  Source.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

struct Source {
    var id: String?
    var name: String?
    var description: String?
    var url: String?
    var category: String?
    var language: String?
    var country: String?
}

extension Source: Decodable {}
