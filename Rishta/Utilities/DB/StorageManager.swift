//
//  StorageManager.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation

protocol LocalStorageService {
    func saveToDatabase(data: PersonRawData) -> Bool
    func fetchFromDatabase() -> [PersonRawData]
    func updateDatabase(data: PersonRawData) -> Bool
}


class StorageManager {
    private let databaseService: LocalStorageService
    
    init(databaseService: LocalStorageService) {
        self.databaseService = databaseService
    }
    
    func saveData(data: PersonRawData)-> Bool{
        if databaseService.saveToDatabase(data: data) {
            print("Successfully saved data to the database.")
            return true
        }
        return false
    }
    
    func fetchData() -> [PersonRawData] {
        let databaseData = databaseService.fetchFromDatabase()
        return databaseData
    }
    
    func updateData(data: PersonRawData)-> Bool{
        if databaseService.updateDatabase(data: data) {
            print("Updated database.")
            return true
        }
        return false
    }
}
