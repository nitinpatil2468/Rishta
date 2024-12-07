//
//  NetworkData.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation
import Alamofire


extension DataResponse {
    func decode<T: Decodable>(model:T.Type) -> Result<T,String> {
        
        do{
            guard let data = try self.result.get() as? Data else { return Result.failure(error?.localizedDescription ?? "")
            }
            
            let dataModel = try JSONDecoder().decode(model.self, from: data)
            return Result.success(dataModel)
            
        }catch{
            print("error : \(error.localizedDescription)")
            return Result.failure(error.localizedDescription)
        }
       
    }
}

enum Result<Success, String> {
    case success(Success)
    case failure(String)
}
