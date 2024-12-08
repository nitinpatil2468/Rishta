//
//  ContentView.swift
//  Rishta
//
//  Created by Abcom on 07/12/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var vm: ProfileListViewModel = ProfileListViewModel(localDBService: CoreDataManager(context: CoreDataService.shared.context))
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            vm.getProfileList()
        }
    }
}

#Preview {
    ContentView()
}
