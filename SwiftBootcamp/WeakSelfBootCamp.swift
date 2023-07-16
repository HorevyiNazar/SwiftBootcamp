//
//  WeakSelfBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 16.07.2023.
//

import SwiftUI

struct WeakSelfBootCamp: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink("Navigate") {
                WeakSelfSecondScreen()
                    .navigationTitle("Screen 1")
            }
        }
        .overlay (
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.cornerRadius(10))
            , alignment: .topTrailing
        )
    }
}

struct WeakSelfBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootCamp()
    }
}
struct WeakSelfSecondScreen: View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            if let data = vm.data {
                Text(data)
            }
        }
    }
}
class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    init() {
        print("Initialize now ")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    deinit {
        print("deinitialize")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: . now() + 500.00) { [weak self] in
            self?.data = "New Data"
        }
        
    }
}
