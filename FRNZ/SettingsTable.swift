//
//  SettingsTable.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/26/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

class SettingsTable: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y;
        
        if (scrollOffset == 0)
        {
            self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
            self.navigationController?.navigationBar.layer.shadowRadius = 0
            self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 0)
            
        } else {
            self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
            self.navigationController?.navigationBar.layer.shadowRadius = 4.5
            self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 5)
            
            self.tabBarController?.tabBar.layer.shadowRadius = 4.5
            self.tabBarController?.tabBar.layer.shadowColor = UIColor.black.cgColor
            self.tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        }
    }
    
}
