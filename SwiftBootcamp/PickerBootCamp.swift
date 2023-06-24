//
//  PickerBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 24.05.2023.
//

import SwiftUI

struct PickerBootCamp: View {
    
    @State var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
//    let attributes: [NSAttributedString.Key:Any] = [
//        .foregroundColor : UIColor.white
//    ]
//    init() {
//        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
//        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
//    }
    
    var body: some View {
            Picker(selection: $selection) {
                ForEach(filterOptions, id: \.self) { option in
                    Text(option)
                        .tag(option)
                }
                
            } label: {
                    Text("Filter: ")
            }
            .pickerStyle(.menu)
            .accentColor(.red)

            //.background(.gray)
        

    }
}

struct PickerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootCamp()
    }
}
