//
//  NewTO.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

struct NewTO {
    let source_id: String
    let source_name: String
    let author: String
    let title: String
    let new_description: String
    let url: URL
    let image_url: URL
    let published: Date
    let content: String
    
    static func valueOf(new: New) -> Self {
        return NewTO(source_id: new.source_id!,
                     source_name: new.source_name!,
                     author: new.author!,
                     title: new.title!,
                     new_description: new.new_description!,
                     url: new.url!,
                     image_url: new.image_url!,
                     published: new.published!,
                     content: new.content!)
    }
    
    static func valuesFrom(articles: Articles) -> [Self] {
        return articles.articles.map { article in
            return NewTO(source_id: article.source.id,
                         source_name: article.source.name,
                         author: article.author,
                         title: article.title,
                         new_description: article.description,
                         url: URL(string: article.url)!,
                         image_url: URL(string: article.urlToImage)!,
                         published: ISO8601DateFormatter().date(from: article.publishedAt)!,
                         content: article.content)
        }
    }
}
