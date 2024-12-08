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

import Alamofire

class NetworkManager {
    static let sharedInstance = NetworkManager()

    // Retained session property
    private let session: Session

    private init() {
        let memoryCapacity = 50 * 1024 * 1024
        let diskCapacity = 100 * 1024 * 1024 
        let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "my_cache")
        URLCache.shared = cache

        session = NetworkManager.createSession()
    }

    private static func createSession() -> Session {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = URLCache.shared
        return Alamofire.Session(configuration: configuration)
    }

    func getSession() -> Session {
        return session
    }

    func performRequestWithoutHeader(serviceType: APIServiceManager,
                                     success: @escaping (_ response: DataResponse<Data, AFError>) -> Void,
                                     failure: @escaping (_ error: String) -> Void) {
        
        getSession().request(serviceType.path,
                        method: serviceType.method,
                        parameters: serviceType.parameters,
                        encoding: JSONEncoding.default,
                        headers: nil)
        .responseData { response in
            switch response.result {
                
            case .success:
                success(response)
                
            case .failure(let error):

                if let request = response.request,
                   let cachedResponse = URLCache.shared.cachedResponse(for: request) {
                    let cachedDataResponse = DataResponse<Data, AFError>(
                        request: request,
                        response: response.response,
                        data: cachedResponse.data,
                        metrics: response.metrics,
                        serializationDuration: 0,
                        result: .success(cachedResponse.data)
                    )
                    success(cachedDataResponse)
                    
                } else {
                    failure(error.localizedDescription)
                }
            }
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
