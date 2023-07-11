//
//  DownloadImageAsync.swift
//  TestSyncAsync
//
//  Created by user on 11.07.2023.
//

import SwiftUI

class DownloadImageAsyncViewModel: ObservableObject {

    @Published var image: UIImage? = nil
    
    func fetchImage() {
        self.image = UIImage(systemName: "heart.fill")
    }
    
}


struct DownloadImageAsync: View {
    
    @StateObject private var viewModel = DownloadImageAsyncViewModel()
    
    var body: some View {
        ZStack{
            if let image = viewModel.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            viewModel.fetchImage()
        }
    }
}

struct DownloadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsync()
    }
}
