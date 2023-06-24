//
//  OnAppearBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 27.05.2023.
//

import SwiftUI

struct OnAppearBootCamp: View {
    //MARK: PROPERTIES
    
    @State var myText: String = "Start text"
    @State var count: Int = 0
    
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "this is the new text"
                }
            })
            .onDisappear(perform: {
                myText = "Ending Screen"
            })
                
            .navigationTitle("On Appear \(count)")
        }
    }
}

struct OnAppearBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBootCamp()
    }
}
