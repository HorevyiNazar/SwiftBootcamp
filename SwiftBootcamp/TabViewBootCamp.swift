//
//  TabViewBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 26.05.2023.
//

import SwiftUI

struct TabViewBootCamp: View {
    
    @State var selectedTab: Int = 0
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
//        TabView {
//            ForEach(icons, id: \.self) { picture in
//                Image(systemName: picture)
//                    .resizable()
//                    .scaledToFit()
//                    .padding(30)
//            }
//
//        }
//        .background(
//            RadialGradient(colors: [Color.red, Color.blue], center: .center, startRadius: 5, endRadius: 300)
//        )
//        .frame(height: 300)
//        .tabViewStyle(.page)
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            Text("BROWSE TAB")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            Text("PROFILE TAB")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
    }
}

struct TabViewBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootCamp()
    }
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
            


        }
    }
}
