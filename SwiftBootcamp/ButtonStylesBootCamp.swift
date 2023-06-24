//
//  ButtonStylesBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 08.06.2023.
//

import SwiftUI

struct ButtonStylesBootCamp: View {
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                Text("Button title")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.mini)
            .buttonStyle(.bordered)
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.regular)
            .buttonStyle(.borderless)
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.small)
            .buttonStyle(.plain)
        }
        .padding()
    }
}

struct ButtonStylesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStylesBootCamp()
    }
}
