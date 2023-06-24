//
//  AsyncImageBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 08.06.2023.
//

import SwiftUI

struct AsyncImageBootCamp: View {
    
    let url = URL(string: "https://images.unsplash.com/photo-1682687221073-53ad74c2cad7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=900&q=60")
    
    var body: some View {
//        AsyncImage(url: url) { Image in
//            Image
//                .resizable()
//                .scaledToFit()
//                .frame(width: 300, height: 300)
//
//        } placeholder: {
//            ProgressView()
//        }
        
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            case .failure:
                Image(systemName: "quistionmark")
                    .font(.headline)
            @unknown default:
                Image(systemName: "quistionmark")
                    .font(.headline)
            }
        }

            
    }
}

struct AsyncImageBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootCamp()
    }
}
