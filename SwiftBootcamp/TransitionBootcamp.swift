//
//  TransitionBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 15.05.2023.
//

import SwiftUI

struct TransitionBootcamp: View {
    
    @State var showView: Bool = true
    
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack {
                Button("Button") {
                    withAnimation{
                        showView.toggle()
                    }
                }
                Spacer()
            }
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.slide)

                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootcamp()
    }
}
