//
//  Articles.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

struct Articles {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

extension Articles: Decodable {}
