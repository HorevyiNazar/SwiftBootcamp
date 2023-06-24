//
//  TextBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 20.04.2023.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello World! This is the Swiftful \nThinking Bootcamp. I am \nreally enjoying this course and learning a lot".lowercased())
//            .font(.body)
//            .fontWeight(.medium)
//            .bold()
//            .underline()
//            .underline(true, color: .red)
//            .italic()
//            .strikethrough(true, color: .green)
            //.font(.system(size: 24, weight: .semibold, design: .monospaced))
            //.baselineOffset(10)
            //.kerning(10)
            .foregroundColor(.blue)
            .multilineTextAlignment(.leading)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.1)
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
