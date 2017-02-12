//
//  contactCell.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/23/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

class contactCell: UITableViewCell {
    
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var lastMessage: UILabel!
    @IBOutlet var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profilePic.layer.cornerRadius = 37.5
        profilePic.layer.masksToBounds = false
        profilePic.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
