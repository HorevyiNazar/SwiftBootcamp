//
//  LazyGridBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 04.05.2023.
//

import SwiftUI

struct LazyGridBootcamp: View {
    let colums: [GridItem] = [
        //GridItem(.fixed(50), spacing: nil, alignment: nil),
        //GridItem(.flexible(), spacing: nil, alignment: nil),
        //GridItem(.adaptive(minimum: 10, maximum: 300), spacing: nil, alignment: nil),
        
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {

            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            LazyVGrid(columns: colums, alignment: .center, spacing: 6, pinnedViews: [.sectionHeaders], content: {
                Section(header:
                            Text("Section 1")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.blue)
                    .padding()
                ) {
                    ForEach(0..<10) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                }
               
                Section(header:
                            Text("Section 2")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.red)
                    .padding()
                ) {
                    ForEach(0..<10) { index in
                        Rectangle()
                            .fill(.green)
                            .frame(height: 150)
                    }
                }
                

                

            })
            
        }
    }
}

struct LazyGridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridBootcamp()
    }
}
