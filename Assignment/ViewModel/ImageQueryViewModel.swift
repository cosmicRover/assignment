//
//  ImageQueryViewModel.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation

class ImageQueryViewModel {
    // MARK: - Model Anchors/initialiers

    private var imageQueryModel: ImageQueryModel

    init() {
        imageQueryModel = ImageQueryModel()
    }

    // MARK: - Getters

    var getImages: [ImageDataModel] {
        imageQueryModel.images
    }

    var getVideos: [VideoDataModel] {
        imageQueryModel.videos
    }

    // MARK: - Setter function

    private func setImages(for _: String, with item: ImageDataModel) {
        imageQueryModel.images.append(item)
    }

    private func setVideos(for _: String, with item: VideoDataModel) {
        imageQueryModel.videos.append(item)
    }

    // MARK: - Netwrok/Caching Requests

    func queryApiForImage(for _: String) {}

    func queryApiForVideo(for _: String) {}

    func queryApiForAdditional(for _: String, startIndex _: Int) {}
}
