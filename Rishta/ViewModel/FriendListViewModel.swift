//
//  FriendListViewModel.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import Foundation


//protocol ProfileListVMProtocol{
//    func getProfileList()
//}

class FriendListViewModel:ObservableObject{
    
    @Published var matchStatus: MatchStatus = .accepted    
    @Published var friendList = [PersonRawData]()
    @Published var isDataLoading:Bool = true

    
    var localStorageService: LocalStorageService
    
    
    init(localDBService: LocalStorageService){
        
        self.localStorageService = localDBService
        
    }
    
    func getFriendList(matchStatus:MatchStatus){
        isDataLoading = true
        
        let dataManager = StorageManager(databaseService: localStorageService)
        
        friendList = dataManager.fetchData().filter{
            $0.accept == (matchStatus == .accepted)
        }
        
        isDataLoading = false

    }
    
   
}

extension FriendListViewModel{
    func rejectMatch(model:PersonRawData){
        updateDB(model)
    }
    
    func updateDB(_ model:PersonRawData?){
        
        guard let model = model else{return}
        
        let dataManager = StorageManager(databaseService: localStorageService)
        if dataManager.updateData(data: model){
            getFriendList(matchStatus: .accepted)
        }
        
    }
}
