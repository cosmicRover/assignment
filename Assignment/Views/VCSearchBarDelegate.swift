//
//  VCSearchBarDelegate.swift
//  Assignment
//
//  Created by Joy Paul on 6/16/20.
//  Copyright © 2020 Joy Paul. All rights reserved.
//

import Foundation
import UIKit

// MARK: - searchBar functionalities and their Delegates

extension ImageQueryViewController: UISearchBarDelegate {
    @objc func handleSearchBar() {
        willSearch(enableSearch: true)
        searchBar.becomeFirstResponder()
    }

    func searchBarCancelButtonClicked(_: UISearchBar) {
        willSearch(enableSearch: false)
    }

    func searchBar(_: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.imageQueryViewModel.queryApiForImage(for: searchText)
            print(searchText)
            self.collectionView.reloadData()
        }
    }

    func displaySearchButton(shouldDisplay: Bool) {
        if shouldDisplay {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }

    func willSearch(enableSearch: Bool) {
        displaySearchButton(shouldDisplay: !enableSearch)
        searchBar.showsCancelButton = enableSearch
        navigationItem.titleView = enableSearch ? searchBar : nil
    }
}
