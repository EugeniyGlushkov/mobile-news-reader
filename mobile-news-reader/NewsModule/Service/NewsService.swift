//
//  NewsService.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

class NewsService: NewsServiceProtocol {
    
    private let repository: NewDaoProtocol
    
    required init(repository: NewDaoProtocol) {
        self.repository = repository
    }
    
    func getNews(forChannel channel: ChannelTO) -> [NewTO] {
        return repository.getAll(byChannel: channel)
    }
    
    func addAll(news: [NewTO]) {
        news.forEach{ new in
            self.repository.add(new: new)
        }
    }
}
