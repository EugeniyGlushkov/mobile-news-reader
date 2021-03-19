//
// Created by evgen on 19.03.2021.
//

import Foundation
import UIKit

protocol NewDetailsViewProtocol {
    func setNew(new: NewTO)
    func setImage(image: UIImage)
    func setPresenter(presenter: NewDetailsPresenterProtocol)
    func failure(error: Error)
}
