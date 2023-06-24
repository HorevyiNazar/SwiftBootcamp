//
//  AnimationCurvesBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 14.05.2023.
//

import SwiftUI

struct AnimationCurvesBootCamp: View {
    
    @State var isAnimated: Bool = false
    let timing: Double = 10.0
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimated.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.spring(
                    response: 0.5,
                    dampingFraction: 0.7,
                    blendDuration: 1.0), value: ValueTransformer())
                //.animation(.spring(), value: ValueTransformer())
//                .animation(Animation.linear(duration: timing), value: ValueTransformer())
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimated ? 350 : 50, height: 100)
//                .animation(Animation.easeIn(duration: timing), value: ValueTransformer())
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimated ? 350 : 50, height: 100)
//                .animation(Animation.easeInOut(duration: timing), value: ValueTransformer())
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimated ? 350 : 50, height: 100)
//                .animation(Animation.easeOut(duration: timing), value: ValueTransformer())
        }
    }
}

struct AnimationCurvesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCurvesBootCamp()
    }
}
