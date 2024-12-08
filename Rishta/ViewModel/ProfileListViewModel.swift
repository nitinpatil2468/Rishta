//
//  ProfileListViewModel.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation


protocol ProfileListVMProtocol{
    func getProfileList()
}

class ProfileListViewModel:ObservableObject,ProfileListVMProtocol{
    
    @Published var isDataLoading:Bool = true
    
    @Published var matchList = [PersonRawData]()
    
    var profileListService: ProfileListServiceProtocol
    var localStorageService: LocalStorageService
    
    
    init(service: ProfileListServiceProtocol = ProfileListService(),
         localDBService: LocalStorageService){
        
        self.profileListService = service
        self.localStorageService = localDBService
        
    }
    
    func getProfileList() {
        
        isDataLoading = true
        ProfileListService().getProfileList { [weak self] response in
            
            guard let self = self else{return}
            
            isDataLoading = false

            switch response {
            case .success(let result):
                
                matchList = mapProfiles(result.results)

                break
                
            case .failure(_):
                
                break
                
            }
        }
    }
    
}



extension ProfileListViewModel{
    
    func mapProfiles(_ list:[Profile]?) -> [PersonRawData]{
        
        guard let list = list else{return []}
        
        let personModels = list.map { profile in
            return PersonRawData(
                id: UUID().uuidString,
                name: getName(nameData: profile.name),
                age: profile.dob?.age,
                accept: false,
                decline: false,
                gender: profile.gender,
                image: profile.picture?.large,
                address: getAddress(address: profile.location)
            )
        }
        
        return personModels
        
    }
    
    private func getName(nameData:Name?)-> String{
        
        guard let data = nameData else{return ""}
        return "\(data.first ?? "") \(data.last ?? "")"
        
    }
    
    private func getAddress(address:Location?)-> String{
        
        guard let data = address else{return ""}
        return "\(data.city ?? ""), \(data.country ?? "")"
        
    }
    
}


extension ProfileListViewModel{
    
    func acceptMatch(model:PersonRawData){
        saveDataInDB(model)
    }
    
    func rejectMatch(model:PersonRawData){
        saveDataInDB(model)
    }
    
    func saveDataInDB(_ model:PersonRawData?){
        
        guard let model = model else{return}
        let dataManager = StorageManager(databaseService: localStorageService)
        let _ = dataManager.saveData(data: model)
        
    }
}
