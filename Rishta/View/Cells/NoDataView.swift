//
//  NoDataView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct NoDataView: View {
    
    
    
    @Binding var selectedTab:Int
    var screenType: EmptyScreenType = .homeScreen
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(systemName: "person.crop.circle.badge.exclamationmark")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)
            
            Text(screenType.heading)
                .font(.headline)
                .foregroundColor(.black)
            
            if !screenType.subHeading.isEmpty{
                Text(screenType.subHeading)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
            
            if !screenType.buttonText.isEmpty{
                
                Button(action: {
                   
                    selectedTab =  screenType == .homeScreen ? 1 : 0
                    
                    
                }) {
                    Text(screenType.buttonText)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                }
            }
            
            
            Spacer()
        }    }
}
