import Foundation
import UIKit

final class ImageLoaderManager {

    private var cache = URLCache.shared

    func loadImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw ImageLoaderError.invalidURL
        }

        if let cachedResponse = cache.cachedResponse(for: URLRequest(url: url)) {
            if let image = UIImage(data: cachedResponse.data) {
                print("from cache")
                return image
            } else {
                throw ImageLoaderError.invalidData
            }
        }

        print("from internet")

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ImageLoaderError.invalidResponse
        }

        guard let image = UIImage(data: data) else {
            throw ImageLoaderError.invalidData
        }

        cache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: URLRequest(url: url))

        return image
    }
}

enum ImageLoaderError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
