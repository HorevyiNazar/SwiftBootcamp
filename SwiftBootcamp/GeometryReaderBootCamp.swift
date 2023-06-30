//
//  GeometryReaderBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 30.06.2023.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    var body: some View {
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle().fill(Color.red)
//                Rectangle().fill(Color.blue).frame(width: geometry.size.width * 0.6666) // 0.6666 for 1/3 of the screen
//            }
//            .ignoresSafeArea()
//        }
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(Angle(degrees: getPercantage(geo: geometry) * 40), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
    func getPercantage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

struct GeometryReaderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootCamp()
    }
}
