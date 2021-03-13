//
//  AllChannelsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import UIKit

class AllChannelsViewController: UIViewController {
    var presenter: AllChannelPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AllChannelsViewController: AllChannelsViewProtocol {
    func setChannels(channels: [Channel]) {
        
    }
}
