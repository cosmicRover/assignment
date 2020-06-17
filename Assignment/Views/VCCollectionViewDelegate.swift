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
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        // dummy data
        cell.imageData = ImageDataModel(id: 1, width: 1, height: 1, largeUrl: "", mediumUrl: "dd", smallUrl: "dd")
        return cell
    }

    func collectionView(_: UICollectionView, willDisplay _: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == 29 {
            print("End of items") //call more items here
        }
    }
}
