//
//  MatchSegmentView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct MatchSegmentView: View {
    
    @Binding var matchStatus: MatchStatus
    
    var body: some View {
        VStack {
            Picker("", selection: $matchStatus) {
                ForEach(MatchStatus.allCases, id: \.self) {
                    Text($0.rawValue.capitalized)
                        .foregroundColor(Color(.TextColor))
                        .font(.title)
                }
            }
            .pickerStyle(.segmented)
            
        }
    }
}
