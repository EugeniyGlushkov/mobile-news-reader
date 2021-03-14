//
//  ChannelDao.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation
import CoreData

class ChannelDao: ChannelDaoProtocol {
    private init() {}
    
    private static let instance = ChannelDao()
    
    static func getInstance() -> ChannelDao {
        return instance
    }
    
    private let helper = CoreDataHelper()
    
    func add(channel: ChannelTO) {
        let channelGuard = get(byId: channel.id, byName: channel.name)
        
        guard channelGuard == nil else {
            return
        }
        
        guard let newChannel = NSEntityDescription.insertNewObject(forEntityName: "Channel", into: helper.context) as? Channel else {
            return
        }
        
        newChannel.id = channel.id
        newChannel.name = channel.name
        newChannel.favourite = channel.favourite
        saveContext()
    }
    
    func remove(byId id: String, byName name: String) {
        let fetchRequest: NSFetchRequest<Channel> = Channel.fetchRequest()
        
        guard let channelToDelete = get(byId: id, byName: name, fetchRequest: fetchRequest) else {
            return
        }
        
        helper.context.delete(channelToDelete)
        saveContext()
    }
    
    func update(channel: ChannelTO) {
        let fetchRequest: NSFetchRequest<Channel> = Channel.fetchRequest()
        
        guard let channelToUpdate = get(byId: channel.id, byName: channel.name, fetchRequest: fetchRequest) else {
            return
        }
        
        channelToUpdate.setValue(channel.id, forKey: "id")
        channelToUpdate.setValue(channel.name, forKey: "name")
        channelToUpdate.setValue(channel.favourite, forKey: "favourite")
        saveContext()
    }
    
    func get(byId id: String, byName name: String) -> ChannelTO? {
        let fetchRequest: NSFetchRequest<Channel> = Channel.fetchRequest()
        
        guard let channel = get(byId: id, byName: name, fetchRequest: fetchRequest) else {
            return nil
        }
        
        return ChannelTO(channel: channel)
    }
    
    private func get(byId id: String, byName name: String, fetchRequest: NSFetchRequest<Channel>) -> Channel? {
        fetchRequest.predicate = NSPredicate(format: "any id = '\(id)' AND name = '\(name)'")
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
        
        return channels.map{
            channel in
            return ChannelTO(channel: channel)
        }
    }
    
    private func saveContext() {
        if helper.context.hasChanges {
            do {
                try helper.context.save()
            } catch {
                helper.context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
