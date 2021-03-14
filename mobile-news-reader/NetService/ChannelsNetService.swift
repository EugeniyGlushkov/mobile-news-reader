//
//  AllChannelsWebService.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

class ChannelsNetService: ChannelsNetServiceProtocol {
    private static let APY_KEY = "c1bd18a5fe4b48fd80074bc490ace0bb"
    
    func getChannels(completion: @escaping (Result<Sources?, Error>) -> Void) {
        let urlString = "https://newsapi.org/v2/sources?apiKey=\(Self.APY_KEY)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode(Sources.self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
