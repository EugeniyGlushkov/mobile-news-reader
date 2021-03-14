//
//  NewsServiceProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

protocol NewsServiceProtocol {
    func getNews(forChannel: ChannelTO) -> [NewTO]
}
