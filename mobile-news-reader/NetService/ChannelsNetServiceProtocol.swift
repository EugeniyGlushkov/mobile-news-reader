//
//  AllChannelsWebServiceProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

protocol ChannelsNetServiceProtocol {
    func getChannels(completion: @escaping (Result<Sources?, Error>) -> Void)
}
