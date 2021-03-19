//
//  NewsViewProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation
import UIKit

protocol NewsViewProtocol: AnyObject {
    var imageUrlsToImages: [URL: UIImage] {get set}
    func update(news: [NewTO])
    func updateImages()
    func setPresenter(presenter: NewsPresenterProtocol)
    func failure(error: Error)
}
