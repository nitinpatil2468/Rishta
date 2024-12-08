//
//  MatchStatus.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import Foundation


enum MatchStatus: String,CaseIterable{
    case accepted
    case declined
    
    var action:String{
        switch self {
        case .accepted:
            "Decline"
        case .declined:
            ""
        }
    }
}
