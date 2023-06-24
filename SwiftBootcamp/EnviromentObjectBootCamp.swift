//
//  EnviromentObjectBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 03.06.2023.
//

import SwiftUI

class EnviromentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["Iphone", "Ipad", "Imac", "Apple Watch"])
        
    }
}

struct EnviromentObjectBootCamp: View {
   
    @StateObject var viewModel: EnviromentViewModel = EnviromentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink {
                        //DetailView(viewModel: viewModel, selectedItem: item) Use without .environmentObject
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle("IOS Devises")
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
   
    //@ObservedObject var viewModel: EnviromentViewModel Use without .environmentObject
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            NavigationLink {
//                FinalView(viewModel: viewModel) Use without .environmentObject
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(25)
            }


        }
    }
}

struct FinalView: View {
    
//    @ObservedObject var viewModel: EnviromentViewModel Use without .environmentObject
     @EnvironmentObject var viewModel: EnviromentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue, Color.red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnviromentObjectBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        EnviromentObjectBootCamp()
//        DetailView(selectedItem: "IPhone")
//        FinalView()
    }
}
