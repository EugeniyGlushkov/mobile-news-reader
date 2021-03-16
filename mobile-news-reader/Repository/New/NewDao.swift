//
//  NewDao.swift
//  mobile-news-reader
//
//  Created by evgen on 15.03.2021.
//

import Foundation
import CoreData

class NewDao: NewDaoProtocol {
    private init() {}
    
    private static let instance = NewDao()
    
    static func getInstance() -> NewDao {
        return instance
    }
    
    private let helper = CoreDataHelper()
    
    func add(new: NewTO) {
        let newGuard = get(bySourceId: new.source_id ?? "",
                           bySourceName: new.source_name ?? "",
                           byAuthor: new.author ?? "",
                           byTitle: new.title ?? "")
        
        guard newGuard == nil else {
            return
        }
        
        guard let addedNew =
                NSEntityDescription.insertNewObject(forEntityName: "New", into: helper.context) as? New else {
            return
        }
        
        addedNew.source_id = new.source_id
        addedNew.source_name = new.source_name
        addedNew.author = new.author
        addedNew.title = new.title
        addedNew.new_description = new.new_description
        addedNew.url = new.url
        addedNew.image_url = new.image_url
        addedNew.published = new.published
        addedNew.content = new.content
        helper.saveContext()
    }
    
    func remove(bySourceId source_id: String,
                bySourceName source_name: String,
                byAuthor author: String,
                byTitle title: String) {
        let fetchRequest: NSFetchRequest<New> = New.fetchRequest()
        
        guard let newToDelete = get(bySourceId: source_id,
                                    bySourceName: source_name,
                                    byAuthor: author,
                                    byTitle: title,
                                    fetchRequest: fetchRequest) else {
            return
        }
        
        helper.context.delete(newToDelete)
        helper.saveContext()
    }
    
    func get(bySourceId source_id: String,
             bySourceName source_name: String,
             byAuthor author: String,
             byTitle title: String) -> NewTO? {
        let fetchRequest: NSFetchRequest<New> = New.fetchRequest()
        
        guard let new = get(bySourceId: source_id,
                            bySourceName: source_name,
                            byAuthor: author,
                            byTitle: title,
                            fetchRequest: fetchRequest) else {
            return nil
        }
        
        return NewTO.valueOf(new: new)
    }
    
    private func get(bySourceId source_id: String,
                     bySourceName source_name: String,
                     byAuthor author: String,
                     byTitle title: String,
                     fetchRequest: NSFetchRequest<New>) -> New? {
        let sourceIdPredicate = NSPredicate(format: "any source_id = \"\(source_id)\"")
        let sourceNamePredicate = NSPredicate(format: "any source_name = \"\(source_name)\"")
        let authorPredicate = NSPredicate(format: "any author = \"\(author)\"")
        let titlePredicate = NSPredicate(format: "any title = \"\(title)\"")
        fetchRequest.predicate =
            NSCompoundPredicate(andPredicateWithSubpredicates: [sourceIdPredicate,
                                                                sourceNamePredicate,
                                                                authorPredicate,
                                                                titlePredicate])
        var news: [New]
        
        do {
            news = try helper.context.fetch(fetchRequest)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return news.isEmpty ? nil : news[0]
    }
    
    func getAll(byChannel channel: ChannelTO) -> [NewTO] {
        let fetchRequest: NSFetchRequest<New> = New.fetchRequest()
        let sourceIdPredicate = NSPredicate(format: "any source_id = \"\(channel.id ?? "")\"")
        let sourceNamePredicate = NSPredicate(format: "any source_name = \"\(channel.name ?? "")\"")
        fetchRequest.predicate =
            NSCompoundPredicate(andPredicateWithSubpredicates: [sourceIdPredicate, sourceNamePredicate])
        var news: [New]
        
        do {
            news = try helper.context.fetch(fetchRequest)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return news.map{
            new in
            return NewTO.valueOf(new: new)
        }
    }
}
