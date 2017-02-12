//
//  chatCell.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/30/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

class chatCell: UICollectionViewCell {
    
    
    let textView : UITextView = {
        let message = UITextView()
        message.font = UIFont.systemFont(ofSize: 15.0)
        message.text = "Something"
        message.textColor = UIColor.darkGray
        message.backgroundColor = UIColor.clear
        
        return message
    }()
    
    let bubble: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.layer.cornerRadius = 15.0
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews(){
        addSubview(bubble)
        addSubview(textView)
    }
    
    
}
