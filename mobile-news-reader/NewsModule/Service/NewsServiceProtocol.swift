//
//  NewsServiceProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

protocol NewsServiceProtocol {
    init(repository: NewDaoProtocol)
    func getNews(forChannel channel: ChannelTO) -> [NewTO]
    func addAll(news: [NewTO])
}
