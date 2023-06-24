//
//  ShapesBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 24.04.2023.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        //Ellipse()
        //Circle()
        //Capsule(style: .continuous)
        //Rectangle()
        RoundedRectangle(cornerRadius: 50)
            //.fill(Color.blue)
            //.stroke(Color.red)
            //.stroke(Color.blue, lineWidth: 30)
            //.stroke(Color.orange, style: StrokeStyle(lineWidth: 20, lineCap: .round,  dash: [30]))
            //.trim(from: 0.2, to: 1.0)
            //.stroke(Color.purple, lineWidth: 50)
            .frame(width: 300, height: 200)
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
