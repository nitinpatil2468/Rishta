//
//  APIServiceManager.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation
import Alamofire

enum APIServiceManager {
    case getProfiles(dataCount:String)
    
    var path :String {
        
        var servicePath = ""
        let baseURL = "randomuser.me/"
        let httpProtocol = "https:"
        
        
        switch self {
        case .getProfiles(dataCount: let count):
            servicePath = "api/?results=\(count)"
            
        }
        print("\(httpProtocol)//\(baseURL)\(servicePath)")
        return "\(httpProtocol)//\(baseURL)\(servicePath)"
    }
    
    var method:HTTPMethod {
        switch self {
            
        case .getProfiles:
            return .get
        }
    }
    
    
    var parameters: [String:Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var encoding:ParameterEncoding {
        switch self {
        case .getProfiles:
            return JSONEncoding.default
        }
    }
}
