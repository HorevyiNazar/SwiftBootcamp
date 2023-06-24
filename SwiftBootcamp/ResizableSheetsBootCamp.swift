//
//  ResizableSheetsBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 19.06.2023.
//

import SwiftUI

struct ResizableSheetsBootCamp: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("Click me") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            MyNextView(detents: $detents)
                //.presentationDetents([.medium, .large]) // can drag to full screen
                //.presentationDetents([.fraction(0.1),.height(300) , .medium, .large])
                .presentationDetents([.medium, .large], selection: $detents)
                
                .presentationDragIndicator(.automatic)
                //.interactiveDismissDisabled()
        }
    }
}

struct MyNextView: View {
    
    @Binding var detents: PresentationDetent
    
    var body: some View {
        
        ZStack {
            Color.red.ignoresSafeArea()

            
            VStack(spacing: 20) {
                Button("Medium") {
                    detents = .medium
                }
                
                Button("Large") {
                    detents = .large
                }
            }
            
        }
    }
}

struct ResizableSheetsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetsBootCamp()
    }
}
