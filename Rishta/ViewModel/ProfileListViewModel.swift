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
    
    @Published var showAlertMessage:Bool = false
    @Published var didSendOtp:Bool = false
    @Published var didCheckUser:Bool = false
    @Published var didPrivacyUrlClicked: Bool = false
    @Published var didGetSigningOption: Bool = false
    
    var titleText:String?
    var url:String?
    var isGoogleSigningAvailable:Bool?
    
    var isUserExist:Bool?
    var phoneText:String?
    var errorMessage:String?
    
    var profileListService: ProfileListServiceProtocol
    var localStorageService: LocalStorageService
    
    
    init(service: ProfileListServiceProtocol = ProfileListService(),
         localDBService: LocalStorageService){
        
        self.profileListService = service
        self.localStorageService = localDBService
        
    }
    
    func getProfileList() {
        ProfileListService().getProfileList { [weak self] response in
            
            guard let self = self else{return}
            
            switch response {
            case .success(let result):
                
                saveDataInDB(result.results)
                break
                
            case .failure(_):
                
                break
                
            }
        }
    }
    
    func saveDataInDB(_ list:[Profile]?){
        
        let mappedProfiles = mapProfiles(list)
        let dataManager = StorageManager(databaseService: localStorageService)
        if (dataManager.saveData(data: mappedProfiles)){
            dataManager.fetchData()
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
