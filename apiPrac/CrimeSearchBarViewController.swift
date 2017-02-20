//
//  CrimeSearchBarViewController.swift
//  apiPrac
//
//  Created by Alex Votry on 2/20/17.
//  Copyright © 2017 Alex Votry. All rights reserved.
//

import UIKit

class CrimeSearchBarViewController: UIViewController {
      //MARK: Properties

      @IBOutlet weak var firstSearchBar: UISearchBar!

      override func viewDidLoad() {
          super.viewDidLoad()

          configureSearchBar()
      }
      func configureSearchBar() {
          firstSearchBar.showsCancelButton = true
          firstSearchBar.showsBookmarkButton = true

          firstSearchBar.tintColor = UIColor.purple
          firstSearchBar.backgroundImage = UIImage(named: "search_bar_background")
          let bookmarkImage = UIImage(named: "bookmark_icon")
          firstSearchBar.setImage(bookmarkImage, for: .bookmark, state: UIControlState())

          let bookmarkHighlightedImage = UIImage(named: "bookmark_icon_highlighted")
          firstSearchBar.setImage(bookmarkHighlightedImage, for: .bookmark, state: .highlighted)
      }

      //MARK: UISearchBarDelagete
      func searchBarSearchButtonClicked(_ firstSearchBar: UISearchBar) {
        print("The search bar button was tapped: \(firstSearchBar).")
        firstSearchBar.resignFirstResponder()
      }
      func searchBarCancelButtonClicked(_ firstSearchBar: UISearchBar) {
        print("The cancel button was tapped: ")
        firstSearchBar.resignFirstResponder()
      }
      func searchBarBookmarkButtonClicked(_ firstSearchBar: UISearchBar) {
        print("The bookmark button was tapped: \(firstSearchBar).")
        firstSearchBar.resignFirstResponder()
      }
}
