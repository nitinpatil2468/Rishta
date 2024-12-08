//
//  PersonRawData.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation

struct PersonRawData:Identifiable {
    let id: String?
    let name: String?
    let age: Int?
    var accept: Bool?
    var decline: Bool?
    let gender: String?
    let image: String?
    let address: String?
}
