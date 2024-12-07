//
//  NetworkManager.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation
import Alamofire

enum NetworkingError: String, Error {
    case badURL
    case serverError
    case unauthorize
    case badrequest
    case decodingError
}

struct ValidationResult{
    let success:Bool?
    let error:String?
}

class NetworkManager {
    static let sharedInstance = NetworkManager()
    private var sessions: [TimeInterval: Alamofire.Session] = [:]
    
    private init(){
        let defaultConfiguration = URLSessionConfiguration.default
        sessions[0] = Alamofire.Session(configuration: defaultConfiguration)
    }
    
    func getSession(timeout: TimeInterval) -> Session {
        if let session = sessions[timeout] {
            return session
        } else {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = timeout
            configuration.timeoutIntervalForResource = timeout
            let session = Alamofire.Session(configuration: configuration)
            sessions[timeout] = session
            return session
        }
    }
    
    func performRequestWithoutHeader(serviceType:APIServiceManager, success:@escaping (_ response:DataResponse<Data, AFError>) -> Void) {
        
        let session = getSession(timeout: 0)
        
        session.request(serviceType.path,
                        method: serviceType.method,
                        parameters: serviceType.parameters,
                        encoding: JSONEncoding.default,
                        headers: nil).responseData {
            response in
            success(response)
        }
    }
}

class CommonMethods{
    func printAPIResponse(data : DataResponse<Data, AFError>)->String{
        guard let data = data.data else {return ""}
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            let result = String(decoding: jsonData, as: UTF8.self)
                        print("DEBUGRESONSE : \(result)")
            return result
        } else {
            debugPrint("json data malformed")
            return "json data malformed"
        }
    }
}
