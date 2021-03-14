//
//  AllChannelsService.swift
//  mobile-news-reader
//
//  Created by evgen on 13.03.2021.
//

import Foundation
import CoreData

class AllChannelsService: AllChannelsServiceProtocol {
    private let repository: ChannelDaoProtocol
    
    required init(repository: ChannelDaoProtocol) {
        self.repository = repository
    }
    
    func getAllChannels() -> [ChannelTO] {
        return repository.getAll()
    }
}
