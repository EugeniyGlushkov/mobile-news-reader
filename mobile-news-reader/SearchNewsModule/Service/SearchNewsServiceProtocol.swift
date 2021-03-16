//
//  SearchNewsServiceProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

protocol SearchNewsServiceProtocol {
    init(repository: NewDaoProtocol)
    func addAll(news: [NewTO])
}
