//
//  CardView.swift
//  Rishta
//
//  Created by Abcom on 08/12/24.
//

import SwiftUI
import SDWebImageSwiftUI


// MARK: - CardView
struct CardView: View {

    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModal: Bool = false
    @State var personData: PersonRawData
    
    @ObservedObject var vm : ProfileListViewModel
    
    @State var isAccepted: Bool = false
    @State var isDeclined: Bool = false

    
    var body: some View {
        
            ZStack(alignment: .top) {
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    
                    Spacer().frame(height: 40)
                    
                    WebImage(url: URL(string: personData.image ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: SizeConstants.cardWidth - 80, height: SizeConstants.cardWidth - 80)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                        )
                        .shadow(radius: 5)
                    
                    Spacer()
                    
                    UserInfoView(info: personData)
                    
                    Divider()
                    
                    Spacer().frame(height: 20)

                    SwipeButtonsView(isAccepted: $isAccepted, isDeclined: $isDeclined)

                    
                }

                
                SwipeIndicatorView(
                    xOffset: $xOffset
                )
            }
        .frame(
            width: SizeConstants.cardWidth,
            height: SizeConstants.cardHeight
        )
        .background(Color(.CardBackground))
        .cornerRadius(12)
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
        
        .onChange(of: isAccepted) { flag in
            flag ? swipeRight() : ()
        }
        
        .onChange(of: isDeclined) { flag in
            flag ? swipeLeft() : ()
        }
    }
}

// MARK: - Swiping functionalities
private extension CardView {
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -15
        } completion: {
            personData.decline = true
            vm.rejectMatch(model: personData)
        }
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 15
        } completion: {
            
            personData.accept = true
            vm.acceptMatch(model: personData)
            
        }
    }
    
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    
}

// MARK: - drag gestures handling
private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width/25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}
