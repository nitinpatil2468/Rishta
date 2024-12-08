//
//  HomeView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {

            CardStackView()
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
            
            MatchListView()
                .tabItem {
                    Label("", systemImage: "heart.slash.fill")
                }
            
           
        }
        .accentColor(Color(.IconColor)) // Customize the selected tab item color
    }
}

#Preview {
    HomeView()
}
