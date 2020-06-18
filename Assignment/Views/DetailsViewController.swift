//
//  DetailsViewController.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12.0
        return iv
    }()

    var imageUrl: String!

    override func viewDidLoad() {
        view.backgroundColor = .white
        constructImageView()
        setImage(with: imageUrl)
    }

    func constructImageView() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12), imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
        ])
    }

    func setImage(with url: String) {
        let url: URL = URL(string: url)!
        ImageDownloader.downloadImage(with: url) { result in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
                return
            case let .success(image):
                self.imageView.image = image
                return
            }
        }
    }
}
