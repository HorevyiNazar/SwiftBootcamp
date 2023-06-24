//
//  InitAndEnumsBootcamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 03.05.2023.
//

import SwiftUI

struct InitAndEnumsBootcamp: View {
    
    let backgroundcolor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        if fruit == .apple {
            self.title = "Apples"
            self.backgroundcolor = .red
        } else {
            self.title = "Oranges"
            self.backgroundcolor = .orange
        }
    }
        
        enum Fruit {
            case apple
            case orange
        }
        
        var body: some View {
            VStack{
                Text("\(count)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .underline()
                Text("\(title)")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(width: 150, height: 150)
            .background(backgroundcolor)
            .cornerRadius(10)
        }
    }
    
    struct InitAndEnumsBootcamp_Previews: PreviewProvider {
        static var previews: some View {
            HStack {
                InitAndEnumsBootcamp(count: 100, fruit: .apple)
                InitAndEnumsBootcamp(count: 46, fruit: .orange)
            }
            
        }
    }

