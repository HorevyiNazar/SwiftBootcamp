//
//  DownloadingImagesBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 03.08.2023.
//

import SwiftUI



struct DownloadingImagesBootCamp: View {
    @StateObject var vm = DownloadingImagesViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

struct DownloadingImagesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesBootCamp()
    }
}
