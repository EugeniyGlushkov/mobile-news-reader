//
//  AllChannelsWebService.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation
import UIKit

class NetService: NetServiceProtocol {
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

    func getNews(forChannel channel: ChannelTO, completion: @escaping (Result<Articles?, Error>) -> Void) {
        let urlString = "https://newsapi.org/v2/everything?sources=\(channel.id ?? "")&apiKey=\(Self.APY_KEY)"

        return getNew(forUrlString: urlString, completion: completion)
    }

    func searchNews(forString string: String, completion: @escaping (Result<Articles?, Error>) -> Void) {
        let urlString = "https://newsapi.org/v2/everything?q='\(string)'&apiKey=\(Self.APY_KEY)"

        getNew(forUrlString: urlString, completion: completion)
    }

    private func getNew(forUrlString urlString: String, completion: @escaping (Result<Articles?, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let obj = try JSONDecoder().decode(Articles.self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func acyncLoadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ()) {
        var image: UIImage?
        var error: Error?

        DispatchQueue.global(qos: .utility).async {
            do {
                let data = try Data(contentsOf: url)
                image = UIImage(data: data)
            } catch let err {
                error = err
            }

            DispatchQueue.main.async {
                completion(image, error)
            }
        }
    }
}
