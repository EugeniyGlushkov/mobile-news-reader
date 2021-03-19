//
// Created by evgen on 19.03.2021.
//

import Foundation

protocol NewDetailsPresenterProtocol {
    init(view: NewDetailsViewProtocol, netService: NetServiceProtocol, new: NewTO)
    func showNew()
    func loadImage(forUrl url: URL)
}
