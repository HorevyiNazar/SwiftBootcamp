//
//  SafeAreaInsectsBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 19.06.2023.
//

import SwiftUI

struct SafeAreaInsectsBootCamp: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Insets")
//            .overlay (
//                    Text("Hi")
//                        .frame(maxWidth: .infinity)
//                        .background(Color.yellow)
//                    ,alignment: .bottom
//            )
            .safeAreaInset(edge: .top, alignment: .leading, spacing: nil) {
                    Text("Hi")
//                        .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .clipShape(Circle())
                    .padding()
            }
        }
    }
}

struct SafeAreaInsectsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaInsectsBootCamp()
    }
}
