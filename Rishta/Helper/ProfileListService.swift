//
//  ProfileListService.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation


protocol ProfileListServiceProtocol {
    
    func getProfileList(_ completion:@escaping(Result<GetProfileListResponse,String>) -> Void)
    
}


class ProfileListService: ProfileListServiceProtocol{
    func getProfileList(_ completion: @escaping (Result<GetProfileListResponse, String>) -> Void) {
        
        
        NetworkManager.sharedInstance.performRequestWithoutHeader(serviceType: .getProfiles(dataCount: "10")) { response in
            
            let str = CommonMethods().printAPIResponse(data: response)
            let modal = response.decode(model: GetProfileListResponse.self)
            completion(modal)
            
        } failure: { error in
            
            debugPrint(error)
        }

    }
    
    
}
