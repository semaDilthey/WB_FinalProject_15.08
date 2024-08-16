//
//  WBWebImage.swift
//
//
//  Created by Семен Гайдамакин on 16.08.2024.
//

import SwiftUI

fileprivate enum LoadingState {
    case loading
    case success(image: UIImage)
    case error(desctiption: String)
}

public struct WBWebImage<LoadingView: View>: View {

    private let imageLoader = ImageLoaderManager()
    private let urlString: String?
    private let onImageLoaded: (UIImage) -> Void
    private let loaderBuilder: LoadingView

    @State private var loadingState : LoadingState = .loading

    public init(urlString: String?,
         @ViewBuilder loadingBuilder: @escaping () -> LoadingView ,
         onImageLoaded: @escaping (UIImage) -> Void)
    {
        self.urlString = urlString
        self.loaderBuilder = loadingBuilder()
        self.onImageLoaded = onImageLoaded
    }

    public var body: some View {
        Group {
            switch loadingState {
            case .loading:
                loaderBuilder
            case .success(let image):
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .error:
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .task {
            await loadImage()
        }
    }
}

extension WBWebImage {

    private func loadImage() async {
           guard let urlString = urlString else { return }

           do {
               let image = try await imageLoader.loadImage(urlString: urlString)
               DispatchQueue.main.async {
                   self.loadingState = .success(image: image)
                   self.onImageLoaded(image)
               }
           } catch {
               DispatchQueue.main.async {
                   self.loadingState = .error(desctiption: error.localizedDescription)
               }
           }
       }

}

#Preview {
    WBWebImage(urlString: "https://sun9-58.userapi.com/impg/Dju4VUcTBsLOzWBkCphMkEBd4n_fuix1NOBaMA/CiGJ_70-Z9E.jpg?size=1000x1000&quality=95&sign=368ceb8d3efee5ba3f6ccb9006141e8b&type=album", loadingBuilder: { ProgressView() },
             onImageLoaded: {_ in })
}
