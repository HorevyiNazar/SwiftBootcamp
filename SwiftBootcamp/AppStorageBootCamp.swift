//
//  AppStorageBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 06.06.2023.
//

import SwiftUI

struct AppStorageBootCamp: View {
   
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text(name)
            }
            Button("Save".uppercased()) {
                let name = "Emily"
                currentUserName = name
            }
        }
    }
}

struct AppStorageBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootCamp()
    }
}
