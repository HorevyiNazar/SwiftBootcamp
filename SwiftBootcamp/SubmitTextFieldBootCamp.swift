//
//  SubmitTextFieldBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 14.06.2023.
//

import SwiftUI

struct SubmitTextFieldBootCamp: View {
    
    @State private var text: String = ""
        
    var body: some View {
        TextField("Placeholder...", text: $text)
            .submitLabel(.route)
            .onSubmit {
                print("Something")
            }
    }
}

struct SubmitTextFieldBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextFieldBootCamp()
    }
}
