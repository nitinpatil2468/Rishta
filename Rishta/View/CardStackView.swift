//
//  CardStackView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct CardStackView: View {
    
    @Binding var selectedTab:Int

    @StateObject var profileListVm: ProfileListViewModel = ProfileListViewModel(localDBService: CoreDataManager(context: CoreDataService.shared.context))
    
    @State var showEmptyRequest: Bool = false
    
    var body: some View {
        NavigationStack {
            
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
                
                if showEmptyRequest{
                   
                    NoDataView(selectedTab: $selectedTab,
                               screenType: .homeScreen)
                    
                }
                                
                if !showEmptyRequest{
                    
                    VStack(spacing: 16) {
                        ZStack {
                            ForEach(profileListVm.matchList) { card in
                                CardView(
                                    showEmptyRequest: $showEmptyRequest,
                                    personData: card,
                                    vm: profileListVm
                                )
                                    .id(card.id)
                            }
                        }
                    }.shimmer(when: $profileListVm.isDataLoading)
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    TopView()
                }
            }
            .onAppear{
                showEmptyRequest = false
                profileListVm.getProfileList()
            }
        }
    }
}


