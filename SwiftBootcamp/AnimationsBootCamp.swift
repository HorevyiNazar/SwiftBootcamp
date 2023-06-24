//
//  AnimationsBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 13.05.2023.
//

import SwiftUI

struct AnimationsBootCamp: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(
                    .default
                        .delay(0.2)
                        .repeatCount(5, autoreverses: true)
                        //.repeatForever(autoreverses: true))
                ){
                    isAnimated.toggle()
                }
                
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y : isAnimated ? 300 : 0)
            Spacer()
            
        }
    }
}

struct AnimationsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsBootCamp()
    }
}
