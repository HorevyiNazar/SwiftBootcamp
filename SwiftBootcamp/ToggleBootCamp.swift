//
//  ToggleBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 22.05.2023.
//

import SwiftUI

struct ToggleBootCamp: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status: ")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            Toggle(isOn: $toggleIsOn) {
                Text("Change Status")
            }
            .tint(.red)
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

struct ToggleBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootCamp()
    }
}
