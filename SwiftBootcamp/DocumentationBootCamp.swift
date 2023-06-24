//
//  DocumentationBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 26.05.2023.
//

import SwiftUI

struct DocumentationBootCamp: View {
    
    //MARK: PROPERTIES
    
    @State var data: [String] = [
        "apples", "oranges", "bananas"
    ]
    @State var showAlert: Bool = false
    // MARK: BODY
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.red.ignoresSafeArea()
                
                // foreground
                foregroundLayer
                .navigationTitle("Documantation")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Alert") {
                            showAlert.toggle()
                        }
                    }
                }
                .alert("ALERT", isPresented: $showAlert) {
                    
            }
            }
        } // END : NAV
    }
    /// This is a foreground layer that holds a scrollView
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self) { fruit in
                Text(fruit)
                    .font(.headline)
            }
        }
    }
}
// MARK: PREVIEW
struct DocumentationBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootCamp()
    }
}
