//
//  CardStackView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

import SwiftUI

struct CardStackView: View {
    
    @StateObject var profileListVm: ProfileListViewModel = ProfileListViewModel(localDBService: CoreDataManager(context: CoreDataService.shared.context))
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                ZStack {
                    ForEach(profileListVm.matchList) { card in
                        CardView(personData: card, vm: profileListVm)
                            .id(card.id)
                    }
                }
                

            }
            .onAppear{
                profileListVm.getProfileList()
            }
            

        }
    }
}

#Preview {
    CardStackView()
}

