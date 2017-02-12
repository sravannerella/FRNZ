//
//  CustomTextBox.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/22/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextBox: UITextField {
    @IBInspectable var borderColor: UIColor? = UIColor.clear {
        didSet {
            layer.borderColor = self.borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = self.borderWidth
            //layer.backgroundColor = UIColor.lightGray.cgColor
        }
    }
    @IBInspectable var bottomBorder:UIColor? = UIColor.lightGray{
        didSet {
            let border = CALayer()
            let width = CGFloat(1.5)
            border.borderColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0).cgColor
            border.frame = CGRect(x: 0, y: layer.frame.size.height - width, width:  layer.frame.size.width, height: layer.frame.size.height)
            
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor?.cgColor
    }
}

