//
//  ImageDownloader.swift
//  Assignment
//
//  Created by Joy Paul on 6/17/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    static let imageCacher = NSCache<NSString, UIImage>()

    static func downloadImage(with url: URL, completition: @escaping (Result<UIImage, Error>) -> Void) {
        // MARK: Caching mechanism. If image exists, return it

        if let image = imageCacher.object(forKey: url.absoluteString as NSString) {
            print("image exists in cache")
            completition(.success(image))

            return // MARK: - Note, without this return, the URL session gets triggered unnecessarily
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            var image: UIImage?

            if let data = data {
                print("downloading image instead")
                image = UIImage(data: data)
                guard let image = image else { return }
                imageCacher.setObject(image, forKey: url.absoluteString as NSString)

                DispatchQueue.main.async {
                    completition(.success(image))
                }

            } else {
                completition(.failure(error!))
            }
        }.resume()
    }
}
