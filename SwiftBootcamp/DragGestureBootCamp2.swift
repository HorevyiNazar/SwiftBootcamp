//
//  DragGestureBootCamp2.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 28.06.2023.
//

import SwiftUI

struct DragGestureBootCamp2: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.84
    @State var currentDragOffsetY: CGFloat = .zero
    @State var endingOffsetY: CGFloat = .zero
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -160 {
                                    endingOffsetY = -startingOffsetY
                                    currentDragOffsetY = 0
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                    currentDragOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        })
                )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DragGestureBootCamp2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootCamp2()
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for my app")
                .multilineTextAlignment(.center)
            
            Text("Create an Account")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black)
                .cornerRadius(10)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
