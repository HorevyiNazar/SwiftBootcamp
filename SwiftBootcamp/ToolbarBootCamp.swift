//
//  ToolbarBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 15.06.2023.
//

import SwiftUI

struct ToolbarBootCamp: View {
    
    @State private var text: String = ""
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                
                Color.white.ignoresSafeArea()
                
                ScrollView {
                    TextField("Placeholder", text: $text)
                    
                    ForEach(0..<50) { _ in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 200, height: 200)
                    }
                }

            }
            .navigationTitle("ToolBar")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
            }
            //.toolbar(.hidden, for: .automatic)
            //.toolbarBackground(.hidden, for: .navigationBar)
            //.toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button("Screen1") {
                    path.append("Screen1")
                }
                Button("Screen1") {
                    path.append("Sreen2")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("New screen: \(value)")
            }
        }
    }
}

struct ToolbarBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarBootCamp()
    }
}
