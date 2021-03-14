//
//  AllChannelsViewController.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import UIKit

class AllChannelsViewController: UIViewController {
    var presenter: AllChannelsPresenterProtocol!
    
    var channels = Array<ChannelTO>()
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(with: AllChannelsTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.showChannels()
        super.viewDidAppear(animated)
    }
}

extension AllChannelsViewController: AllChannelsViewProtocol {
    func setPresenter(presenter: AllChannelsPresenter) {
        self.presenter = presenter
    }
    
    func update(channels: [ChannelTO]) {
        self.channels = channels
        tableView.reloadData()
    }
    
    func failure(error: Error){
        //TODO: - need to be implemented
        print(error)
    }
}

extension AllChannelsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: AllChannelsTableViewCell.self)
        let channel = channels[indexPath.row]
        cell.textLabel?.text = channel.name
        cell.addToFavouritesHandler = {
            self.presenter.addToFavourites(channel: channel)
        }
        return cell
    }
}

extension UITableView {
    func registerNib(with type: NameDiscribable.Type) {
        self.register(UINib(nibName: type.typeName, bundle: nil), forCellReuseIdentifier: type.typeName)
    }
    
    func dequeueReusableCell<T: NameDiscribable> (with type: T.Type) -> T {
        return self.dequeueReusableCell(withIdentifier: type.typeName) as! T
    }
}
