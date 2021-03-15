//
//  Article.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

struct Article {
    let source: CuttedSource
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

extension Article: Decodable {}
