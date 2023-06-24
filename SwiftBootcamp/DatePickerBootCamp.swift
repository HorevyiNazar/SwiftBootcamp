//
//  DatePickerBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 24.05.2023.
//

import SwiftUI

struct DatePickerBootCamp: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }
   
    
    var body: some View {
        VStack {
            Text("Selected Date is:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            
            
            DatePicker("Select a Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
            //DatePicker("Select a Date", selection: $selectedDate, displayedComponents: [.date])
            //DatePicker("Select a Date", selection: $selectedDate)
                .tint(.green)
                
            .datePickerStyle(.compact)
        }
    }
}

struct DatePickerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootCamp()
    }
}
