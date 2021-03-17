//
//  NewTO.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

struct NewTO {
    let source_id: String?
    let source_name: String?
    let author: String?
    let title: String?
    let description_new: String?
    let url: URL?
    let image_url: URL?
    let published: Date?
    let content: String?
    
    static func valueOf(new: EntityNew) -> Self {
        return NewTO(source_id: new.source_id,
                     source_name: new.source_name,
                     author: new.author,
                     title: new.title,
                     description_new: new.description_new,
                     url: new.url,
                     image_url: new.image_url,
                     published: new.published,
                     content: new.content)
    }
    
    static func valuesFrom(articles: Articles) -> [Self] {
        guard let safeArticles = articles.articles else { return [] }
        
        return safeArticles.map { article in
            let url: URL? = article.url == nil ? nil : URL(string: article.url!)
            let imageUrl: URL? = article.urlToImage == nil ? nil : URL(string: article.urlToImage!)
            
            return NewTO(source_id: article.getSource().id,
                         source_name: article.getSource().name,
                         author: article.author,
                         title: article.title,
                         description_new: article.description,
                         url: url,
                         image_url: imageUrl ,
                         published: ISO8601DateFormatter().date(from: article.publishedAt ?? ""),
                         content: article.content )
        }
    }
}
