//
//  AnimationUpdatedBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 19.06.2023.
//

import SwiftUI

struct AnimationUpdatedBootCamp: View {
    
    @State private var animate1: Bool = false
    @State private var animate2: Bool = false

    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Button("Action1") {
                    animate1.toggle()
                }
                Button("Action2") {
                    animate2.toggle()
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: animate1 ? .leading : .trailing)
                        .background(Color.green)
                        .frame(maxHeight: .infinity, alignment: animate2 ? .top : .bottom)
                        .background(Color.orange)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
            }
        }
        .animation(.spring(), value: animate1)
        .animation(.linear(duration: 5), value: animate2)
    }
}

struct AnimationUpdatedBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationUpdatedBootCamp()
    }
}
