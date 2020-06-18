//
//  ViewController.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import CFNetwork
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

    // MARK: - Notification handler

    let center = NotificationCenter.default

    // MARK: - VC setups

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        buildSearchBar()
        buildColelctionView()
        center.addObserver(self, selector: #selector(reloadData), name: Notification.Name("have_data"), object: nil)
    }

    // MARK: - Handle incoming data to the tableView

    @objc func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    // MARK: - UI Constructors

    func buildColelctionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32), collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -22),
        ])
    }

    func buildSearchBar() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        let nav = navigationController
        navigationItem.title = "Search.."
        nav!.navigationBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
        navigationController!.navigationBar.barStyle = .default
        navigationController!.navigationBar.isTranslucent = true
        nav?.navigationBar.prefersLargeTitles = true
        displaySearchButton(shouldDisplay: true)
    }
}
