//
//  GetProfileListResponse.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import Foundation

// MARK: - GetProfileListResponse
struct GetProfileListResponse: Codable {
    let results: [Profile]?
    let info: Info?
}

// MARK: - Info
struct Info: Codable {
    let version: String?
    let results: Int?
    let seed: String?
    let page: Int?
}

// MARK: - Profile
struct Profile: Codable {
    let id: IdentityInfo?
    let nat, cell, phone: String?
    let login: LoginInfo?
    let dob, registered: Dob?
    let picture: Picture?
    let location: Location?
    let email: String?
    let gender: String?
    let name: Name?
}

// MARK: - Dob
struct Dob: Codable {
    let date: String?
    let age: Int?
}

// MARK: - IdentityInfo
struct IdentityInfo: Codable {
    let name: String?
    let value: String?
}

// MARK: - Location
struct Location: Codable {
    let street: Street?
    let city, country: String?
    let timezone: Timezone?
    let coordinates: Coordinates?
    let state: String?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let longitude, latitude: String?
}

// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - Timezone
struct Timezone: Codable {
    let description, offset: String?
}

// MARK: - LoginInfo
struct LoginInfo: Codable {
    let sha256, password, md5, uuid: String?
    let username, sha1, salt: String?
}

// MARK: - Name
struct Name: Codable {
    let title: String?
    let first, last: String?
}

// MARK: - Picture
struct Picture: Codable {
    let large, thumbnail, medium: String?
}

