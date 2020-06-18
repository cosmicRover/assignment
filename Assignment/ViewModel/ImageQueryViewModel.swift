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
    private let center = NotificationCenter.default
    private var currentPage = 1
    private var key = ""

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

    private func setNewImagesOnSearch(with item: ImageDataModel) {
        imageQueryModel.images.append(item)
    }

    private func setNewVideosOnSearch(for _: String, with item: VideoDataModel) {
        imageQueryModel.videos.append(item)
    }

    // MARK: - Netwrok/Caching Requests

    func queryApiForImage(for key: String) {
        imageQueryModel.images.removeAll()
        ImageQueryService.fetchImageJSON(for: key, amount: 30, page: currentPage) { value in
            switch value {
            case let .failure(err):
                print(err.localizedDescription)
                return
            case let .success(values):

                self.imageQueryModel.images.removeAll() // MARK: - Removes the previous results

                values.forEach { item in
                    self.setNewImagesOnSearch(with: item)
                    self.center.post(name: Notification.Name("have_data"), object: nil)
                }
                self.currentPage = 1
                self.key = key
                return
            }
        }
    }

    func queryApiForVideo(for _: String) {}

    func queryApiForAdditionalImages() {
        currentPage += 1
        ImageQueryService.fetchImageJSON(for: key, amount: 30, page: currentPage) { value in
            switch value {
            case let .failure(err):
                print(err.localizedDescription)
                return
            case let .success(values):
                values.forEach { item in
                    self.setNewImagesOnSearch(with: item)
                    self.center.post(name: Notification.Name("have_data"), object: nil)
                }
                return
            }
        }
    }
}
