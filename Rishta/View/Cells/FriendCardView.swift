//
//  FriendCardView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct FriendCardView: View {
    
    @State var personData: PersonRawData
    @ObservedObject var vm : FriendListViewModel
    
    @State private var showPicker = false
    let options = [MatchStatus.accepted.action]
    
 
    var body: some View {

            HStack {
                WebImage(url: URL(string: personData.image ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    
                    Group{
                        HStack(alignment: .center){
                            
                            Text(personData.name ?? "")
                                .font(.headline)
                            
                            Spacer()
                            
                            if personData.accept ?? false{
                                
                                Menu {
                                    ForEach(options, id: \.self) { option in
                                        Button(action: {
                                           
                                            
                                            personData.decline = true
                                            personData.accept = false
                                            vm.rejectMatch(model: personData)
                                            
                                        }) {
                                            Text(option)
                                        }
                                    }
                                } label: {
                                    Image("dots")
                                        .resizable()
                                        .frame(width: 20,height: 20)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                       
                        Text("\(personData.age ?? 0) yrs")
                            .font(.subheadline)
                        Text(personData.address ?? "")
                            .font(.subheadline)
                    }
                    .foregroundColor(Color(.TextColor))

                }
                
                Spacer()
            }
            .padding(20)
            .background(Color(.CardBackground))
            .cornerRadius(12)
    }
}
