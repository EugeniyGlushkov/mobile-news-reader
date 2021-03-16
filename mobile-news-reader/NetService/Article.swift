//
//  Article.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

struct Article {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    func getSource() -> Source {        
        return source ?? Source(id: "", name: "")
    }
    
    struct Source: Decodable {
        var id: String?
        var name: String?
    }
}

extension Article: Decodable {}
