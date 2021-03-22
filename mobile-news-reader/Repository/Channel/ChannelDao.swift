//
//  ChannelDao.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation
import CoreData

class ChannelDao: ChannelDaoProtocol {
    private init() {
    }

    private static let instance = ChannelDao()

    static func getInstance() -> ChannelDao {
        return instance
    }

    private let helper = CoreDataHelper()

    func add(channel: ChannelTO) {
        guard let newChannel = NSEntityDescription.insertNewObject(forEntityName: "Channel", into: helper.context) as? Channel else {
            return
        }

        newChannel.id = channel.id
        newChannel.name = channel.name
        newChannel.favourite = channel.favourite ?? false
        helper.saveContext()
    }

    func remove(byId id: String, byName name: String) {
        let fetchRequest: NSFetchRequest<Channel> = Channel.fetchRequest()

        guard let channelToDelete = get(byId: id, byName: name, fetchRequest: fetchRequest) else {
            return
        }

        helper.context.delete(channelToDelete)
        helper.saveContext()
    }

    func update(channel: ChannelTO) {
        let fetchRequest: NSFetchRequest<Channel> = Channel.fetchRequest()

        guard let channelToUpdate = get(byId: channel.id ?? "", byName: channel.name ?? "", fetchRequest: fetchRequest) else {
            return
        }
        
        channelToUpdate.setValue(channel.id, forKey: "id")
        channelToUpdate.setValue(channel.name, forKey: "name")
        channelToUpdate.setValue(channel.favourite ?? false, forKey: "favourite")
        helper.saveContext()
    }

    func get(byId id: String, byName name: String) -> ChannelTO? {
        let fetchRequest: NSFetchRequest<Channel> = Channel.fetchRequest()

        guard let channel = get(byId: id, byName: name, fetchRequest: fetchRequest) else {
            return nil
        }

        return ChannelTO.valueOf(channel: channel)
    }

    private func get(byId id: String, byName name: String, fetchRequest: NSFetchRequest<Channel>) -> Channel? {
        let idPredicate = NSPredicate(format: "any id = \"\(id)\"")
        let namePredicate = NSPredicate(format: "any name = \"\(name)\"")
        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [idPredicate, namePredicate])
        var channels: [Channel]

        do {
            channels = try helper.context.fetch(fetchRequest)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }

        return channels.isEmpty ? nil : channels[0]
    }

    func getAll() -> [ChannelTO] {
        let fetchRequest: NSFetchRequest<Channel> = Channel.fetchRequest()
        var channels: [Channel]

        do {
            channels = try helper.context.fetch(fetchRequest)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }

        return channels.map {
            channel in
            return ChannelTO.valueOf(channel: channel)
        }
    }

    func getFavourites() -> [ChannelTO] {
        let fetchRequest: NSFetchRequest<Channel> = Channel.fetchRequest()
        let predicate = NSPredicate(format: "any favourite = true")
        fetchRequest.predicate = predicate
        var channels: [Channel]

        do {
            channels = try helper.context.fetch(fetchRequest)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }

        return channels.map {
            channel in
            return ChannelTO.valueOf(channel: channel)
        }
    }
}
