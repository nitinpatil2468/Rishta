//
//  SizeConstants.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct SizeConstants {
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 40
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}
