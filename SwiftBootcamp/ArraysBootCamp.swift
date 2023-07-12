//
//  ArraysBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 12.07.2023.
//

import SwiftUI

struct UsersModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UsersModel] = []
    @Published var filteredArray: [UsersModel] = []
    @Published var mappedArray: [String] = []
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UsersModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UsersModel(name: "Chris", points: 22, isVerified: false)
        let user3 = UsersModel(name: nil, points: 35, isVerified: true)
        let user4 = UsersModel(name: "Emily", points: 15, isVerified: false)
        let user5 = UsersModel(name: "Samantha", points: 85, isVerified: true)
        let user6 = UsersModel(name: "Jason", points: 85, isVerified: true)
        let user7 = UsersModel(name: "Sarah", points: 75, isVerified: false)
        let user8 = UsersModel(name: nil, points: 56, isVerified: true)
        let user9 = UsersModel(name: "Steve", points: 55, isVerified: false)
        let user10 = UsersModel(name: "Amanda", points: 34, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
            
        ])
    }
    func updateFilteredArray() {
        // sort
//        filteredArray = dataArray.sorted { user1, user2 in
//            return user1.points > user2.points
//        } Same as below
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
        
        // filter
//        filteredArray = dataArray.filter({ user in
//            return user.isVerified
//        })
//        filteredArray = dataArray.filter({$0.isVerified})
        
        // map
//        mappedArray = dataArray.map({ user in
//            return user.name ?? "Error"
//        })
//        mappedArray = dataArray.map({$0.name})
//        mappedArray = dataArray.compactMap({ user in
//            return user.name
//        })
//        mappedArray = dataArray.compactMap({$0.name})
        mappedArray = dataArray
            .sorted(by: {$0.points > $1.points})
            .filter({$0.isVerified})
            .compactMap({$0.name})
        
    }
    
}

struct ArraysBootCamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Point: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

struct ArraysBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootCamp()
    }
}
