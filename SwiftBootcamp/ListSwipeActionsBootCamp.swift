//
//  ListSwipeActionsBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 13.06.2023.
//

import SwiftUI

struct ListSwipeActionsBootCamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Archive") {
                            
                        }
                        .tint(.green)
                        Button("Save") {
                            
                        }
                        .tint(.blue)
                        Button("Junk") {
                            
                        }
                        .tint(.black)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button("Share") {
                            
                        }
                        .tint(.yellow)
                    }
            }
            //.onDelete(perform: delete)
        }
    }
    func delete(indexSet: IndexSet) {
        
    }
}

struct ListSwipeActionsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionsBootCamp()
    }
}
