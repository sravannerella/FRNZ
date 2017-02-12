//
//  messageView.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/24/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

class messageView: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var titleString: String?
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var messageText: UITextField!
    struct messageComponents{
        var text:String?
        var sent:String?
        
        init(text:String, sent:String){
            self.text = text
            self.sent = sent
        }
    }
    
    @IBOutlet var viewer: UIView!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var newBottomConstraint: NSLayoutConstraint!
    
    var messages: [messageComponents] = [messageComponents.init(text: "Hello", sent: "1"), messageComponents.init(text: "How are you lets test this thing completely. OK lets continue too and go on and on", sent: "0"), messageComponents.init(text: "OK buddy lets add few more comments so this looks big and can be tested a bit easily.", sent: "1"), messageComponents(text: "Done buddy. Lets go and move on and keep on adding new messages and make it bulky", sent: "0"), messageComponents(text: "Awesome! lovely test trying", sent:"1"), messageComponents(text: "Super Movie. Its awesome go and watch it for sure", sent: "1"), messageComponents(text: "What are you talking about? which movie is it?", sent: "1"), messageComponents(text: "Is it English or Telugu??", sent: "0"), messageComponents(text: "Telugu", sent: "1")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup the navigationBar and tabBar
        self.navigationItem.title = titleString
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        //Handling KeyBoard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll()
    }
    
    func keyboardShow(notification: NSNotification){
        if let userInfo = notification.userInfo{
            
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
            
            let keyboardShow = notification.name == NSNotification.Name.UIKeyboardWillShow
            
            if (keyboardShow){
                newBottomConstraint.constant = frame!.height
            } else{
                newBottomConstraint.constant = 5
            }
            scroll()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        messageText.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scroll(){
        let item = messages.count - 1
        let indexs = NSIndexPath(item: item, section: 0)
        self.collectionView.scrollToItem(at: indexs as IndexPath, at: .bottom, animated: false)
    }
    
    func setup(){
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowRadius = 4.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back@1x.png"), style: .plain, target: self, action: #selector(backButtonPressed))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Menu"), style: .plain, target: self, action: #selector(editButton))
        
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
    }
    
    func editButton(){
        
    }
    
    func backButtonPressed(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! chatCell
        cell.textView.text = messages[indexPath.row].text
        let sender = messages[indexPath.row].sent
        
        if sender == "1"{
            if let messageText = messages[indexPath.row].text {
                let size = CGSize(width: 250, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimate = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15.0)], context: nil)
                cell.textView.frame = CGRect(x: 20, y: 0, width: estimate.width + 16, height: estimate.height + 20)
                cell.bubble.frame = CGRect(x: 10, y: 0, width: estimate.width+26, height: estimate.height + 20)
                cell.bubble.backgroundColor = UIColor.white
            }
        } else {
            if let messageText = messages[indexPath.row].text {
                let size = CGSize(width: 250, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimate = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15.0)], context: nil)
                cell.textView.frame = CGRect(x: view.frame.width - estimate.width - 16 - 8, y: 0, width: estimate.width + 16, height: estimate.height + 20)
                cell.textView.textColor = UIColor.white
                cell.bubble.frame = CGRect(x: view.frame.width - estimate.width - 32, y: 0, width: estimate.width+26, height: estimate.height + 20)
                cell.bubble.backgroundColor = UIColor(red:0.11, green:0.11, blue:0.18, alpha:1.0)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let messageText = messages[indexPath.row].text {
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimate = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15.0)], context: nil)
            return CGSize(width: view.frame.width, height: estimate.height + 20)
        }
        
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(8, 0, 0, 0)
    }
    
}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
