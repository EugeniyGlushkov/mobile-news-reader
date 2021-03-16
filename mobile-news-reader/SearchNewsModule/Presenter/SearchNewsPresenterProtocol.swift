//
//  SearchNewsPresenterProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

protocol SearchNewsPresenterProtocol: AnyObject {
    init(view: SearchNewsViewProtocol, service: SearchNewsServiceProtocol, netService: NetServiceProtocol)
    func searchNews(forStrinf string: String)
}
