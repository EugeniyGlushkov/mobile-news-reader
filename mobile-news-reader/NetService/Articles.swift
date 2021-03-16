//
//  Articles.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

struct Articles {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

extension Articles: Decodable {}
