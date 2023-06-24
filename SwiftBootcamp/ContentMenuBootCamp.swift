//
//  ContentMenuBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 21.05.2023.
//

import SwiftUI

struct ContentMenuBootCamp: View {
    
    @State var backgroundColor: Color = Color.blue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor).cornerRadius(30)
        .contextMenu {
            Button {
                backgroundColor = .yellow
            } label: {
                Label("Button1", systemImage: "flame.fill")
            }
            Button {
                backgroundColor = .red
            } label: {
                Text("Button2")
            }
            Button {
                backgroundColor = .green
            } label: {
                HStack{
                    Text("Button")
                    Image(systemName: "heart.fill")
                }
            }

        }
    }
}

struct ContentMenuBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ContentMenuBootCamp()
    }
}
