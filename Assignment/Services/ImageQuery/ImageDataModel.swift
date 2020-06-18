//
//  Image.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation

struct ImageDataModel: Decodable {
    let id: Int
    let medUrl: String
    let largeUrl: String
    let smallUrl: String

    // MARK: - Convert JSON to data models

    static func parseData(for json: [[String: Any]]) -> [ImageDataModel] {
        var yieldedValues: [ImageDataModel] = [ImageDataModel]()

        json.forEach { item in
            let id: Int = item["id"] as! Int

            let src = item["src"] as! [String: String]
            let medUrl: String = src["medium"]!
            let largeUrl: String = src["large"]!
            let smallUrl: String = src["small"]!

            yieldedValues.append(ImageDataModel(id: id, medUrl: medUrl, largeUrl: largeUrl, smallUrl: smallUrl))
        }

        return yieldedValues
    }
}
