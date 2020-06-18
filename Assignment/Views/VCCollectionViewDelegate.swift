//
//  VCCollectionView.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UICollectionView and their delegates

extension ImageQueryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3.5, height: view.frame.size.width / 3.5)
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return imageQueryViewModel.getImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell

        guard imageQueryViewModel.getImages.count > 0 else { return cell }

        cell.downloadedData = imageQueryViewModel.getImages[indexPath.row]
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.imageUrl = imageQueryViewModel.getImages[indexPath.row].largeUrl
        present(vc, animated: true, completion: nil)
    }

    func collectionView(_: UICollectionView, willDisplay _: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let count = imageQueryViewModel.getImages.count
        if indexPath.row == count - 1, count >= 30 {
            print("end of the collectionView")
            imageQueryViewModel.queryApiForAdditionalImages()
        }
    }
}
