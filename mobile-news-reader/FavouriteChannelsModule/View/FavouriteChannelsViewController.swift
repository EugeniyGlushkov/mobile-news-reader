//
//  FavouriteChannelsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation
import UIKit

class FavouriteChannelsViewController: UIViewController {
    var presenter: FavouriteChannelsPresenterProtocol!
    
    var channels = Array<ChannelTO>()
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(with: FavouriteChannelsTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.showChannels()
        super.viewDidAppear(animated)
    }
}

extension FavouriteChannelsViewController: FavouriteChannelsViewProtocol {
    func update(channels: [ChannelTO]) {
        self.channels = channels
        tableView.reloadData()
    }
    
    func setPresenter(presenter: FavouriteChannelsPresenterProtocol) {
        self.presenter = presenter
    }
}

extension FavouriteChannelsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: FavouriteChannelsTableViewCell.self)
        let channel = channels[indexPath.row]
        cell.textLabel?.text = channel.name
        cell.deleteFromFavouritesHandler = {
            self.presenter.deleteFromFavourites(channel: channel)
            self.presenter.showChannels()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = channels[indexPath.row]
        let newsVC = ModuleConfigurator.createNewsModule(channel: channel)
        navigationController?.pushViewController(newsVC, animated: true)        
    }
}
