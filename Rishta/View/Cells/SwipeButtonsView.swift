//
//  SwipeButtonsView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct SwipeButtonsView: View {
    
    @Binding var isAccepted: Bool
    @Binding var isDeclined: Bool

    var body: some View {
        HStack {
            Button(action: {
                print("Decline tapped")
                isDeclined.toggle()
               
            }) {
                Text("Decline")
                    .font(.headline)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 1)
                    )
            }
            
            Button(action: {
                print("Accept tapped")
                isAccepted.toggle()
                
            }) {
                HStack {
                    Text("Accept")
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
            }
        }
        .padding([.bottom,.horizontal],20)
    }
}
