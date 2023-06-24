//
//  LongPressGestureBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 24.06.2023.
//

import SwiftUI

struct LongPressGestureBootCamp: View {
    
    @State var isComplete: Bool = false
    @State var isSucces: Bool = false
    
    var body: some View {
//        Text(isComplete ? "Completed" : "Not Complete")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
//            .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
//                isComplete.toggle()
//            }
        VStack {
            Rectangle()
                .fill(isSucces ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            HStack {
                Text("Click here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSucces {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        withAnimation(.easeInOut) {
                            isSucces = true
                        }
                    }


                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSucces = false
                    }
            }

        }
    }
}

struct LongPressGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootCamp()
    }
}
