//
//  ColorsBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 24.04.2023.
//

import SwiftUI
struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //.red
                //Color(UIColor.secondarySystemBackground)
                Color("CustomColor")
                
            )
            .frame(width: 300, height: 200)
            //.shadow(radius: 10)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -30, y: -20)

    }
}

struct ColorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorsBootcamp()
    }
}
