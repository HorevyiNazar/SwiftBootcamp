//
//  BackgroundandOverlayBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 28.04.2023.
//

import SwiftUI

struct BackgroundandOverlayBootcamp: View {
    var body: some View {
//        Text("Hello, World!")
//            .background(
//                //.red
//                //LinearGradient(colors: <#T##[Color]#>, startPoint: <#T##UnitPoint#>, endPoint: <#T##UnitPoint#>)
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 100, height: 100)
//                )
//            .background(
//                        Circle()
//                            .fill(.red)
//                            .frame(width: 120, height: 120)
//                    )
//        Circle()
//            .fill(.pink)
//            .frame(width: 100, height: 100)
//            .overlay(
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//            )
//            .background(
//                Circle()
//                    .fill(.purple)
//                    .frame(width: 110, height: 110)
//
//            )
//        Rectangle()
//            .frame(width: 100, height: 100)
//            .overlay(
//                Rectangle()
//                    .fill(.blue)
//                    .frame(width: 50, height: 50)
//                , alignment: .topLeading
//            )
//            .background(
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150)
//                , alignment: .bottomTrailing
//            )
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.red, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                       )
                    .frame(width: 100, height: 100)
                    .shadow(color: .black, radius: 10, x: 0, y: 10)
                    .overlay(
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: .red, radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing
                        )
                )
    }
}

struct BackgroundandOverlayBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundandOverlayBootcamp()
    }
}
