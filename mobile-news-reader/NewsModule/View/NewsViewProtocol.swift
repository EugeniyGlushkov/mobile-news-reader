//
//  NewsViewProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

protocol NewsViewProtocol: AnyObject {
    func update(news: [NewTO])
    func setPresenter(presenter: NewsPresenterProtocol)
}
