//
//  TextEditorBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 22.05.2023.
//

import SwiftUI

struct TextEditorBootCamp: View {
    
    @State var textEditorText: String = "Type here"
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    //.foregroundColor(.white)
                    .colorMultiply(.gray.opacity(0.5))
                    .cornerRadius(10)
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Text(savedText)
                Spacer()
            }
            .padding()
            .navigationTitle("Text Editor BootCamp")
        }
    }
}

struct TextEditorBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootCamp()
    }
}
