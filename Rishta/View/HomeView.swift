//
//  HomeView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTab = 0

    var body: some View {
        
        TabView(selection: $selectedTab) {

            CardStackView(selectedTab: $selectedTab)
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
                .tag(0)
            
            MatchListView(selectedTab: $selectedTab)
                .tabItem {
                    Label("", systemImage: "heart.slash.fill")
                }
                .tag(1)
           
        }
        .accentColor(Color(.IconColor)) // Customize the selected tab item color
    }
}

#Preview {
    HomeView()
}
