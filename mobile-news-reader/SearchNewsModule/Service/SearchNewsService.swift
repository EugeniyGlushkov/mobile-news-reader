//
//  SearchNewsService.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

class SearchNewsService: SearchNewsServiceProtocol {
    private let repository: NewDaoProtocol
    
    required init(repository: NewDaoProtocol) {
        self.repository = repository
    }
    
    func addAll(news: [NewTO]) {
        news.forEach { new in
            repository.add(new: new)
        }
    }
    
    
}
