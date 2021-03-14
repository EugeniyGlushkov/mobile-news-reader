//
//  NewsPresenterProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation

protocol NewsPresenterProtocol: AnyObject {
    init(view: NewsViewProtocol, service: NewsServiceProtocol, netService: NetServiceProtocol, channel: ChannelTO)
    func showNews()
}
