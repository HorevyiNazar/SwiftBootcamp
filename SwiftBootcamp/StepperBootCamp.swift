//
//  StepperBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 25.05.2023.
//

import SwiftUI

struct StepperBootCamp: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper 2") {
                //increment
                incrementWidth(amount: 100)
            } onDecrement: {
                //decrement
                incrementWidth(amount: -100)
            }
            .padding(50)

        }
    }
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct StepperBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootCamp()
    }
}
