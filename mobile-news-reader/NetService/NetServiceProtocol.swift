//
//  AllChannelsWebServiceProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

protocol NetServiceProtocol {
    func getChannels(completion: @escaping (Result<Sources?, Error>) -> Void)
    func getNews(forChannel channel: ChannelTO, completion: @escaping (Result<Articles?, Error>) -> Void)
    func searchNews(forString string: String, completion: @escaping (Result<Articles?, Error>) -> Void)
}
