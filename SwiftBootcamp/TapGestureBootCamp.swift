//
//  TapGestureBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 29.05.2023.
//

import SwiftUI

struct TapGestureBootCamp: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? Color.green : Color.red)
            
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
            }
            
            Text("TAP Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2) {
                    isSelected.toggle()
                }
            
            Spacer()

        }
        .padding(40)
    }
}

struct TapGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureBootCamp()
    }
}
