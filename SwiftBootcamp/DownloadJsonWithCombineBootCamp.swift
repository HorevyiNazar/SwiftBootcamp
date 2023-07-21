//
//  DownloadJsonWithCombineBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 21.07.2023.
//

import SwiftUI
import Combine

struct PostModel1: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModel1] = []
    var cancellables = Set<AnyCancellable>()
    
    init () {
        getPosts()
    }
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        // Combine discussion
        /*
         // 1. sign up for monthly subscription
         // 2. the company would make the package behind the scenes
         // 3. recive the package
         // 4. make sure the box isnt damaged
         // 5. open and make sure the item is correct
         // 6. use the item
         // 7. cancallable at any time
         */
        
        
        // 1. create a publisher
        URLSession.shared.dataTaskPublisher(for: url)
        // 2. subscirbe the publisher on background thread
            .subscribe(on: DispatchQueue.global(qos: .background))
        // 3. recieve on main thread
            .receive(on: DispatchQueue.main)
        // 4. tryMap ( ckech if data is good )
            .tryMap(handleOutput)
        // 5. decode ( decode data into PostModel1 )
            .decode(type: [PostModel1].self, decoder: JSONDecoder())
        // 6. sink ( put the item into our app )
            .sink { completion in
                switch completion {
                case .finished: print("finished")
                case .failure(let error) : print("there was an error \(error)")
                }
            } receiveValue: {  [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
        // 7. store ( cancel subscription if needed )
            .store(in: &cancellables)
        
    }
    func handleOutput(output: Publishers.ReceiveOn<Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>, DispatchQueue>.Output) throws -> Data {
        
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
        
    }
}


struct DownloadJsonWithCombineBootCamp: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct DownloadJsonWithCombineBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadJsonWithCombineBootCamp()
    }
}
