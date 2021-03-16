//
//  SearchNewsViewProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

protocol SearchNewsViewProtocol: AnyObject {
    func update(news: [NewTO])
    func setPresenter(presenter: SearchNewsPresenterProtocol)
    func failure(error: Error)
}
