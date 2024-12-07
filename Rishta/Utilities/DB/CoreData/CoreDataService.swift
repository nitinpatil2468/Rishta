//
//  CoreDataService.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation
import CoreData


class CoreDataService {
    static let shared = CoreDataService()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DBModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
