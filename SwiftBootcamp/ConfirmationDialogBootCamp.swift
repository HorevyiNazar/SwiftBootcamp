//
//  ConfirmationDialogBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 20.05.2023.
//

import SwiftUI
struct ConfirmationDialogBootCamp: View {
   
    @State var backgroundColor: Color = Color.white
    @State var showConfirmationDialog: Bool = false

    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            Button("Click me") {
                showConfirmationDialog.toggle()
            }
            .confirmationDialog(Text("Dialog"), isPresented: $showConfirmationDialog) {
                Button("Red") { backgroundColor = Color.red }
                Button("Green") {backgroundColor = Color.green}
                Button("Remove Color", role: .destructive) {backgroundColor = .clear}
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("This is the message")
            }
        }
    }
}

struct ConfirmationDialogBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialogBootCamp()
    }
}
