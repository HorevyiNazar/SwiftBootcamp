//
//  PopOverBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 15.05.2023.
//

import SwiftUI

struct PopOverBootcamp: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button("Button") {
                    withAnimation(.spring()){
                        showNewScreen.toggle()}
                }
                .font(.largeTitle)
                Spacer()
            }
            // METHOD 1
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen()
            // METHOD 2
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                       // .animation(.spring())
//                }
//            }
//            .zIndex(2.0)
            // METHOD 3
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top, 100)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
        }
    }
}
struct NewScreen: View {
    
    @Environment(\.dismiss) var dismissScreen
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            Color.purple
                .edgesIgnoringSafeArea(.all)
            Button {
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
    }
}

struct PopOverBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PopOverBootcamp()
    }
}
