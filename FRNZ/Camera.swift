//
//  Camera.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/29/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

class Camera: UIViewController {

    @IBOutlet var takePhoto: UIImageView!
    
    @IBOutlet var save: UIButton!
    @IBOutlet var cameraScreen: UIImageView!
    @IBOutlet var cancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancel.isHidden = true
        save.isHidden = true
        takePhoto.clipsToBounds = true
        takePhoto.layer.cornerRadius = 25
        takePhoto.layer.masksToBounds = false
        takePhoto.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(photoTaken))
        takePhoto.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    func photoTaken(){
        takePhoto.image = #imageLiteral(resourceName: "Checked Circle")
        takePhoto.layer.shadowOpacity = 0.75
        takePhoto.layer.shadowRadius = 5.0
        takePhoto.layer.shadowColor = UIColor.white.cgColor
        cancel.isHidden = false
        cameraScreen.image = #imageLiteral(resourceName: "cameraShot")
        save.isHidden = false
    }
    
    @IBAction func cancelled(_ sender: AnyObject) {
        takePhoto.image = #imageLiteral(resourceName: "Circle")
        cancel.isHidden = true
        cameraScreen.image = nil
        save.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
