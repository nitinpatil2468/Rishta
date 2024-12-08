//
//  CoreDataManager.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation
import CoreData

class CoreDataManager: LocalStorageService {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveToDatabase(data: PersonRawData) -> Bool {
        
//        for person in data {
            let personEntity = UserProfile(context: context)
            personEntity.name = data.name
            personEntity.age = Int64(data.age ?? 0)
            personEntity.isAccepted = data.accept ?? false
            personEntity.isDeclined = data.decline ?? false
            personEntity.address = data.address ?? ""
            personEntity.image = data.image ?? ""
            personEntity.gender = data.gender ?? ""
            personEntity.userId = data.id ?? ""
//        }
        
        do {
            try context.save()
            print("Successfully saved all people")
            return true
        } catch {
            print("Failed to save people: \(error)")
        }
        
        return false
    }
    
    func fetchFromDatabase() -> [PersonRawData] {
        let fetchRequest: NSFetchRequest<UserProfile> = UserProfile.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.map { person in
                PersonRawData(
                    id: person.userId,
                    name: person.name,
                    age: NSNumber(value: person.age).intValue,
                    accept: person.isAccepted,
                    decline: person.isDeclined,
                    gender: person.gender,
                    image: person.image,
                    address: person.address
                )
            }
        } catch {
            print("Failed to fetch people: \(error)")
            return []
        }
    }
}
