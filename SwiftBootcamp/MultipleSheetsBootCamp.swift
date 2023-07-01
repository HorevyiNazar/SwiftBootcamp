//
//  MultipleSheetsBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 01.07.2023.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}
// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootCamp: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
        }
        }
    }
}
struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title).font(.largeTitle)
    }
}

struct MultipleSheetsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootCamp()
    }
}
