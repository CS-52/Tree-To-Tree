//
//  InitialViewController.swift
//  TreeToTree
//
//  Created by Jose Miguel Giron on 8/4/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class Search: UIViewController, UISearchBarDelegate {
    
    var searchArray = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategoryArray()
        
        let searchController = UISearchController(searchResultsController: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCategoryArray(){
        searchArray = [
            "Challah",
            "Breakfast Feed",
            "Homeless",
            "Cooking",
            "Translate"
        ]
    }
    
}

extension Search: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        <#code#>
    }
    
}
