//
//  SpacerBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 03.05.2023.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
                    
                Spacer()
                
                Image(systemName: "gear")
                
            }
            .font(.title)
            .background(.yellow)
            .padding(.top)
            .padding(.horizontal)
            
            Spacer()
            
            Rectangle()
                .frame(height: 55)
        }
    }
}
struct SpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootcamp()
    }
}
