//
//  ImageQueryService.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation

class ImageQueryService {
    static func fetchImageJSON(for queryKey: String?, amount quantity: Int, page index: Int, completition: @escaping (Result<[ImageDataModel], Error>) -> Void) {
        guard let key = queryKey else { return }

        let urlString = APIConstants.imageQueryUrl + key + "&per_page=\(quantity)&page=\(index)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        session.invalidateAndCancel() // discrds any previous session if in progress

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("\(APIConstants.key)", forHTTPHeaderField: "Authorization")

        session.dataTask(with: request) { data, response, error in

            // MARK: - HTTP error handling

            if error != nil || data == nil {
                print("Client error")
                return
            }

            guard let response = response as? HTTPURLResponse, (200 ... 299).contains(response.statusCode) else {
                print("server error: May have reached the rate limit")
                return
            }

            // MARK: - Parse json data via the data models

            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    if let items = json["photos"] as? [[String: Any]] {
                        completition(.success(ImageDataModel.parseData(for: items)))
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completition(.failure(error))
            }

        }.resume()
    }
}
