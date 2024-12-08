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
            
            
//            [UIColor.blue.cgColor, UIColor.cyan.cgColor]
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(UIColor.GradientOne), location: 0.0),
                        .init(color: Color(UIColor.GradientTwo), location: 0.4),
                        .init(color: Color(UIColor.GradientTwo), location: 0.5),
                        .init(color: Color(UIColor.GradientOne), location: 1.0)
                    ]),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                    )

                    .edgesIgnoringSafeArea(.all)
                
                
                
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(profileListVm.matchList) { card in
                            CardView(personData: card, vm: profileListVm)
                                .id(card.id)
                        }
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    TopView()
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

//.background(
//
//)
