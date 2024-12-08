//
//  MatchListView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI

struct MatchListView: View {
    
    @Binding var selectedTab:Int

    @StateObject var friendListVm: FriendListViewModel = FriendListViewModel(localDBService: CoreDataManager(context: CoreDataService.shared.context))
    
    @State var matchStatus: MatchStatus = .accepted

    
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
                
                
                VStack{
                    
                    MatchSegmentView(matchStatus: $matchStatus)
                        .padding(.horizontal,20)
                    
                    if friendListVm.friendList.isEmpty{
                       
                        NoDataView(selectedTab: $selectedTab,
                                   screenType: matchStatus == .accepted ? .acceptedScreen : .declinedScreen)                       
                        
                    }
                    
                    if !friendListVm.friendList.isEmpty{
                        
                        
                        ScrollView {
                            LazyVStack {
                                ForEach(friendListVm.friendList, id: \.id) { item in
                                    FriendCardView(personData: item, vm: friendListVm)
                                        .id(item.id)
                                        .padding(.horizontal, 20)
                                }
                            }
                            .shimmer(when: $friendListVm.isDataLoading)
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
                friendListVm.getFriendList(matchStatus: matchStatus)
            }
            
            .onChange(of: matchStatus) {
                friendListVm.getFriendList(matchStatus: matchStatus)
            }
        }
    }
}
