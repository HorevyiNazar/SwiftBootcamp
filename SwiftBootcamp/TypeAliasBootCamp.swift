//
//  TypeAliasBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 16.07.2023.
//

import SwiftUI
struct MovieModel {
    let title: String
    let director: String
    let count: Int
}
typealias TVModel = MovieModel

struct TypeAliasBootCamp: View {
    
    //@State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TVTittle", director: "Emily", count: 10)

    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypeAliasBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TypeAliasBootCamp()
    }
}
