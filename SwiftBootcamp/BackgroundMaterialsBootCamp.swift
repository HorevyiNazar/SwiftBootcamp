//
//  BackgroundMaterialsBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 08.06.2023.
//

import SwiftUI

struct BackgroundMaterialsBootCamp: View {
    
    let url = URL(string: "https://images.unsplash.com/photo-1682687221073-53ad74c2cad7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=900&q=60")
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
            AsyncImage(url: url)
        )
    }
}

struct BackgroundMaterialsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialsBootCamp()
    }
}
