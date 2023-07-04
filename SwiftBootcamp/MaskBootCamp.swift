//
//  MaskBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 04.07.2023.
//

import SwiftUI

struct MaskBootCamp: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay {
                    overlayView.mask(starsView)
                }
        }
    }
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    //.fill(LinearGradient(colors: [Color.blue, Color.yellow], startPoint: .top, endPoint: .bottom))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootCamp()
    }
}
