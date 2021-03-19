//
// Created by evgen on 19.03.2021.
//

import Foundation

class NewDetailsPresenter: NewDetailsPresenterProtocol {
    private var view: NewDetailsViewProtocol!
    private let netService: NetServiceProtocol!
    private let new: NewTO

    required init(view: NewDetailsViewProtocol, netService: NetServiceProtocol, new: NewTO) {
        self.view = view
        self.netService = netService
        self.new = new
    }

    func showNew() {
        view.setNew(new: new)
    }

    func loadImage(forUrl url: URL) {
        netService.acyncLoadImage(url: url) { result, error in
            guard let image = result else {
                self.view.failure(error: error!)
                return
            }

            DispatchQueue.main.async {
                self.view.setImage(image: image)
            }
        }
    }

}
