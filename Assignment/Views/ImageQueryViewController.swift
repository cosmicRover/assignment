//
//  ViewController.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import UIKit

class ImageQueryViewController: UIViewController {
    // MARK: - UI Anchors

    let searchBar = UISearchBar()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ImageCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    // MARK: - ViewModel

    let imageQueryViewModel = ImageQueryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        buildSearchBar()
        buildColelctionView()
    }

    // MARK: - UI Constructors

    func buildColelctionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white

        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -22).isActive = true
    }

    func buildSearchBar() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        let nav = navigationController
        navigationItem.title = "Search.."
        nav?.navigationBar.prefersLargeTitles = true
        displaySearchButton(shouldDisplay: true)
    }
}
