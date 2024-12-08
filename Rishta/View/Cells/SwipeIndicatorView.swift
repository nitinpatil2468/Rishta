//
//  SwipeIndicatorView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct SwipeIndicatorView: View {
    
    @Binding var xOffset: CGFloat
    
    var body: some View {
        HStack {
            Text("Accept")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 140, height: 48)
                }.rotationEffect(.degrees(-30))
                .opacity(Double(xOffset/SizeConstants.screenCutoff))
            
            Spacer()
            
            
            Text("Decline")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 140, height: 48)
                }.rotationEffect(.degrees(30))
                .opacity(Double(xOffset/SizeConstants.screenCutoff * -1))
        }.padding(60)
    }
}

#Preview {
    SwipeIndicatorView(xOffset: .constant(090))
}
