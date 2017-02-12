//
//  customNavigationBar.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/23/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

class customNavigationBar: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.castShadow = ""
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension UINavigationBar {
    
    var castShadow : String {
        get { return " " }
        set {
            self.layer.shadowOffset = CGSize(width: 0, height:0)
            self.layer.shadowRadius = 0.0
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.1
        }
    }
    
}
