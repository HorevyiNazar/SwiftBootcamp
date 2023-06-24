//
//  GradientsBoorcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 24.04.2023.
//

import SwiftUI

struct GradientsBoorcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //.red
                //LinearGradient(
                    //gradient: Gradient(colors: [.red, .orange]),
                    //startPoint: .topLeading,
                    //endPoint: .bottom)
                //RadialGradient(
                    //colors: [.red, .orange],
                    //center: .center,
                    //startRadius: 5,
                    //endRadius: 200)
                AngularGradient(
                    colors: [.red, .orange],
                    center: .center,
                    angle: .degrees(180 + 45))
            )
            .frame(width: 300, height: 200)
    }
}

struct GradientsBoorcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientsBoorcamp()
    }
}
