//
//  NavigationBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 15.05.2023.
//

import SwiftUI

struct NavigationBootCamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
              
                NavigationLink("Hello") {
                    MyOtherScreen()
                }
                
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .navigationTitle("All inboxes")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        MyOtherScreen()
                    } label: {
                        Image(systemName: "person.fill")
                    }
                    .tint(.red)

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: "flame.fill")
                        Image(systemName: "gear")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
            //.toolbar(.hidden)
        }
        
    }
}
struct MyOtherScreen: View {
    
    @Environment(\.dismiss) var dismissScreen
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Green Screen")
                //.toolbar(.hidden)
            VStack {
                Button("Back Button") {
                    dismissScreen()
                }
                .padding(.top ,50)
            }
            
            NavigationLink("Next Screen") {
                Text("3rd Screen")
            }
            
        }
    }
}

struct NavigationBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBootCamp()
    }
}
