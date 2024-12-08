//
//  Screen.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import Foundation


enum EmptyScreenType: String,CaseIterable{
    
    case acceptedScreen
    case homeScreen
    case declinedScreen

    
    var heading:String{
        switch self {
        
        case .acceptedScreen:
            "Nothing to show"
        case .homeScreen:
            "No pending Requests"
        case .declinedScreen:
            "Nothing to show"
        }
    }
    
    var subHeading:String{
        switch self {
        
        case .acceptedScreen:
            "Go for New Matches."
        case .homeScreen:
            "Take the next step, check out your Accepted Matches."
        case .declinedScreen:
            ""
        }
    }
    
    var buttonText:String{
        switch self {
        case .acceptedScreen:
            "Let's Match"
        case .homeScreen:
            "View Accepted Matches"
        case .declinedScreen:
            ""
        }
    }
    
}






