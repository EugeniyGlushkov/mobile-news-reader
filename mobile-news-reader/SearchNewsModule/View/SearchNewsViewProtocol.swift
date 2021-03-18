//
//  SearchNewsViewProtocol.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation
import UIKit

protocol SearchNewsViewProtocol: AnyObject {
    func update(news: [NewTO])
    func updateImages(imageUrlsToImages: [URL:UIImage])
    func setPresenter(presenter: SearchNewsPresenterProtocol)
    func failure(error: Error)
}
