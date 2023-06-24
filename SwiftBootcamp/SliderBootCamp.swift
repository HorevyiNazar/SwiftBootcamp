//
//  SliderBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 25.05.2023.
//

import SwiftUI

struct SliderBootCamp: View {
    
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    var body: some View {
        VStack {
            Text("Rating: ")
            Text(
            //    "\(sliderValue)"
                String(format: "%.0f", sliderValue) // %.numberOfDecimalPointsf
            )
            .foregroundColor(color)
            //Slider(value: $sliderValue)
            //Slider(value: $sliderValue, in: 1...5)
            //Slider(value: $sliderValue, in: 1...5, step: 1.0)
            Slider(value: $sliderValue, in: 1...5, label: {
                Text("Title")
            }, minimumValueLabel: {
                Text("1")
            }, maximumValueLabel: {
                Text("5")
            }, onEditingChanged: { _ in
                color = .green
            })
                .tint(.red)
        }
    }
}

struct SliderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootCamp()
    }
}
