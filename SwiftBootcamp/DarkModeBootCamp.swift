//
//  DarkModeBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 26.05.2023.
//

import SwiftUI

struct DarkModeBootCamp: View {
   
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This is Primary")
                        .foregroundColor(.primary)
                    Text("This is Secondary")
                        .foregroundColor(.secondary)
                    Text("This color is Black")
                        .foregroundColor(.black)
                    Text("This color is White")
                        .foregroundColor(.white)
                    Text("This color is Red")
                        .foregroundColor(.red)
                    Text("This Color if globally adaptive")
                        .foregroundColor(Color("AdaptiveColor"))
                    Text("This color is locally adaptive")
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode")
        }
    }
}

struct DarkModeBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkModeBootCamp()
                .preferredColorScheme(.dark)
            DarkModeBootCamp()
                .preferredColorScheme(.light)
        }
        
    }
}
