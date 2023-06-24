//
//  TextFieldBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 22.05.2023.
//

import SwiftUI

struct TextFieldBootCamp: View {
    
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    //.textFieldStyle(.roundedBorder)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(20)
                    .foregroundColor(.red)
                    .font(.headline)
                Button {
                    if textIsAppropriate() {
                        saveText()
                    }
                } label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.blue : Color.gray)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .disabled(!textIsAppropriate())

                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextFieldBootCamp")
        }
    }
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
}

struct TextFieldBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootCamp()
    }
}
