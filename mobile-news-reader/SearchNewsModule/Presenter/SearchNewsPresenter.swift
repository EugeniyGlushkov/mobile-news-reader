//
//  SearchNewsPresenter.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation
import UIKit

class SearchNewsPresenter: SearchNewsPresenterProtocol {
    weak private var view: SearchNewsViewProtocol!
    private let service: SearchNewsServiceProtocol!
    private let netService: NetServiceProtocol!

    required init(view: SearchNewsViewProtocol, service: SearchNewsServiceProtocol, netService: NetServiceProtocol) {
        self.view = view
        self.service = service
        self.netService = netService
    }

    func searchNews(forString string: String) {
        netService.searchNews(forString: string) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let articles):
                let news = NewTO.valuesFrom(articles: articles ?? Articles(status: "ok", totalResults: 0, articles: []))
                DispatchQueue.main.async {
                    self.view?.update(news: news)
                }
                self.service.addAll(news: news)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.failure(error: error)
                }
            }
        }
    }

    func loadImage(url: URL, toView view: UIImageView) {
        netService.acyncLoadImage(url: url) { result, error in
            guard let image = result else {
                self.view.failure(error: error!)
                return
            }

            view.image = image.toSquare()!.resizeImage(targetSize: CGSize(width: 346, height: 346))
        }
    }
}

extension UIImage {
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    
    return newImage!
  }
    
    func toSquare() -> UIImage? {
        guard let selfImage = self.cgImage else {
            return nil
        }
        let cutSize = selfImage.width > selfImage.height ? selfImage.height : selfImage.width
        let shiftX = selfImage.width > selfImage.height ? (selfImage.width - cutSize) / 2 : 0
        let shiftY = selfImage.width > selfImage.height ? 0 : (selfImage.height - cutSize) / 2
        let rect = CGRect(x: shiftX, y: shiftY, width: cutSize, height: cutSize)
        
        guard let cgImage = self.cgImage?.cropping(to: rect) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}
