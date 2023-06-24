//
//  ForeEach.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 03.05.2023.
//

import SwiftUI

struct ForeEach: View {
    var body: some View {
        //        VStack {
        //            ScrollView(.vertical, showsIndicators: false, content: {
        //                ForEach(0..<10) { index in
        //                    Rectangle()
        //                        .fill(.blue)
        //                        .frame(height: 300)
        //                }
        //            })
        //
        //
        //        }
        ScrollView{
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }

                        }
                    })

                }
            }
        }
    }
}

struct ForeEach_Previews: PreviewProvider {
    static var previews: some View {
        ForeEach()
    }
}
