//
//  AlertsBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 20.05.2023.
//

import SwiftUI

struct AlertsBootCamp: View {
    
    @State var showAlert: Bool = false
    @State var backgroundColor: Color = Color.yellow
    
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            HStack{
                Button("BUTTON1") {
                    showAlert.toggle()
                }
                Button("BUTTON2") {
                    showAlert.toggle()
                }
            }
            .alert(Text("Error"), isPresented: $showAlert) {
                Button(role: .cancel) {
                    
                    backgroundColor = .red
                } label: {
                    Text("Cancel")
                }
                Button(role: .destructive) {
                    backgroundColor = .yellow
                } label: {
                    Text("Finish")
                }
            }
        message: {
            Text("Unable to find location")
        }
        }
    }
}


struct AlertsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertsBootCamp()
    }
}
