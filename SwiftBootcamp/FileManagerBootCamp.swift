//
//  FileManagerBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 26.07.2023.
//

import SwiftUI
class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    init() {
        createFolderIfNeeded()
    }
    func createFolderIfNeeded() {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName, conformingTo: .folder).path()
        else { return }
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Succes creating folder")
            } catch let error {
                print("Error creating folder \(error)")
            }
        }
    }
    func deleteFolder() {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName, conformingTo: .folder).path()
        else { return }
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Succes deleting folder")
        } catch let error {
            print("Error deleting folder \(error)")
        }
    }
    func saveImage(image: UIImage, name: String) -> String {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name)
        else {
            return "Error getting data"
        }
        
        do {
            try data.write(to: path)
            print(path)
            return "Succes saving"
        } catch let error {
            return "Error saving \(error)"
        }
    }
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("error getting path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path(),
            FileManager.default.fileExists(atPath: path) else {
            return "error getting path"
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Succesfully deleted"
        } catch let error {
            return "Error deleting image \(error)"
        }
    }
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName, conformingTo: .folder)
                .appendingPathComponent("\(name).jpg") else {
            print("Error getting path")
            return nil
        }
        return path
    }
}

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "IMG_3364"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    init() {
        getImageFromAssets()
        //getImageFromFileManager()
    }
    func getImageFromAssets() {
        image = UIImage(named: imageName)
    }
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    func saveImage() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
}


struct FileManagerBootCamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                HStack {
                    Button {
                        vm.saveImage()
                    } label: {
                        Text("Save to FM")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Button {
                        vm.deleteImage()
                    } label: {
                        Text("Delete from FM")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    
                }
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

struct FileManagerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerBootCamp()
    }
}
