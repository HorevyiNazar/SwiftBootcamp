//
//  CondtionalBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 09.05.2023.
//

import SwiftUI

struct CondtionalBootcamp: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("IS LOADING") {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
            
//            Button("Circle Button: \(showCircle.description)") {
//                showCircle.toggle()
//            }
//            Button("Rectangle Button: \(showRectangle.description)") {
//                showRectangle.toggle()
//            }
//            // ! = false
//
//            if showCircle /* == true */{
//                Circle()
//                .frame(width: 100, height: 100)}
//
//            if showRectangle{
//                Rectangle()
//                    .frame(width: 100, height: 100)
//            }
//            // && = and || = or
//            if showCircle || showRectangle {
//                RoundedRectangle(cornerRadius: 25)
//                    .frame(width: 200, height:  100)
//            }
            Spacer()
        }
    }
}

struct CondtionalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CondtionalBootcamp()
    }
}
