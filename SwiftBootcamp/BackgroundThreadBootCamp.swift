//
//  BackgroundThreadBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 15.07.2023.
//

import SwiftUI
class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("Check 1\(Thread.isMainThread)")
            print("Check 1\(Thread.current)")
            
            DispatchQueue.main.async {
                print("Check 2\(Thread.isMainThread)")
                print("Check 2\(Thread.current)")
                self.dataArray = newData
            }
        }
    }
    private func downloadData() -> [String] {
        var data: [String] = []
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadBootCamp: View {
    
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load data".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                ForEach(vm.dataArray, id: \.self) { data in
                    Text(data)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct BackgroundThreadBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThreadBootCamp()
    }
}
