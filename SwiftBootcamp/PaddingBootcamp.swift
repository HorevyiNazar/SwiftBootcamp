//
//  PaddingBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 03.05.2023.
//

import SwiftUI

struct PaddingBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World!")
    //            .background(.yellow)
    //            //.padding()
    //            .padding(.all, 10)
    //            .padding(.leading, 20)
    //            .background(.blue)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            Text("This is the description of what we will do in this screen.It is multiple lines and we will algn the text to the leading edge")
                
        }
        
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: .black.opacity(0.3),
                    radius: 10,
                    x: 0, y: 10)
        )
        .padding(.horizontal, 10)
        
    }
}

struct PaddingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingBootcamp()
    }
}
