//
//  ViewController.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/22/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var username: CustomTextBox!
    @IBOutlet var password: CustomTextBox!
    @IBOutlet var goButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scrollingEnd)))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollingEnd(){
        username.resignFirstResponder()
        password.resignFirstResponder()
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == password) {
            scrollView.setContentOffset(CGPoint(x: 0, y: 150), animated: true)
        } else if(textField == username){
            scrollView.setContentOffset(CGPoint(x:0, y:75), animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

}

