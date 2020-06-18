//
//  CollectionViewCell.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    var downloadedData: ImageDataModel? {
        didSet {
            guard let imageData = downloadedData else { return }
            let url: URL = URL(string: imageData.medUrl)!
            ImageDownloader.downloadImage(with: url) { result in
                switch result {
                case let .failure(error):
                    print(error.localizedDescription)
                    return
                case let .success(image):
                    self.cellView.image = image
                    return
                }
            }
        }
    }

    let cellView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12.0
        iv.layer.borderWidth = 2.0
        iv.layer.borderColor = UIColor(red: 81 / 255, green: 91 / 255, blue: 107 / 255, alpha: 1).cgColor
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(cellView)
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
