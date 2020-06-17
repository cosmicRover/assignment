//
//  ImageQueryModel.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation

class ImageQueryModel {
    // MARK: - State holding data structures

    var images: [ImageDataModel]
    var videos: [VideoDataModel]

    // MARK: - init state variables

    init() {
        images = [ImageDataModel]()
        videos = [VideoDataModel]()
    }
}
