//
//  EscapingBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 16.07.2023.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] DownloadResult in
            self?.text = DownloadResult.data
        }
    }
    func downloadData() -> String {
        return "New data!"
    }
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data!")
    }
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data!")
        }
    }
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New Data")
            completionHandler(result)
        }
    }
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New Data")
            completionHandler(result)
        }
    }
    
}

struct DownloadResult {
    let data: String
}
typealias DownloadCompletion = (DownloadResult) -> ()


struct EscapingBootCamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootCamp()
    }
}
