//
//  TopView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        
        HStack(spacing: 6) {
            Image("appLogo")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: 24, height: 24)
            
            Text("Rishta")
                .font(.headline)
                .italic()
                .bold()
        }
        
    }
}

#Preview {
    TopView()
}
