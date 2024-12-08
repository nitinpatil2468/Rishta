//
//  UserInfoView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct UserInfoView: View {
    let info: PersonRawData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(info.name ?? ""),")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("\(info.age ?? 0)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            Text(info.address ?? "")
                .font(.subheadline)
                .lineLimit(2)
            
        }.padding(20)
         .foregroundStyle(Color(.TextColor))
            
    }
}
