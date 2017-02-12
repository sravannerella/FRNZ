//
//  Messages.swift
//  FRNZ
//
//  Created by Sravan Nerella on 10/23/16.
//  Copyright © 2016 Zoofa. All rights reserved.
//

import UIKit

class Messages: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    struct Users{
        var name:String?
        var text:String?
        var read:Bool?
        
        init(name:String, text:String, read:Bool){
            self.text = text
            self.name = name
            self.read = read
        }
    }
    
    var selected:Int = 0
    
    var names:[Users] = [ Users.init(name: "Sravan Nerella", text: "This is the last text I sent",read: false), Users.init(name: "Zoofa", text: "I am waiting for you reply.", read: false), Users.init(name: "Akhil", text: "Busy with fraternity", read: true), Users.init(name: "Irfan", text: "Go BasketBall", read: true), Users.init(name: "Sai", text: "Yeah! time to drink chocolate milk", read: false), Users.init(name: "Nickwan", text: "Wow!!!", read: true), Users.init(name: "Zyrah", text: "I am so excited and anxious to develop something.", read: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage()
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)
        
        self.tabBarController?.tabBar.shadowImage = img
        self.tabBarController?.tabBar.backgroundImage = img
        names.sort(by: { $0.read! && !$1.read! })
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        names.sort(by: { $0.read! && !$1.read! })
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
        tableView.deselectRow(at: indexPath, animated: false)
        self.performSegue(withIdentifier: "showMessages", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showMessages"){
            let dvc:messageView = segue.destination as! messageView
            dvc.titleString = names[selected].name
            dvc.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! contactCell
        
        if names[indexPath.row].read == false {
            cell.layer.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.97, alpha:1.0).cgColor
        }
        cell.profilePic.image = UIImage(named: "profilePic")
        cell.name.text = names[indexPath.row].name
        cell.lastMessage.text = names[indexPath.row].text
        return cell
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

extension UITableViewCell{
    var separatorStyle: UITableViewCellSeparatorStyle {
        get {return .none}
        set {
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor(red:0.96, green:0.96, blue:0.97, alpha:1.0).cgColor
        }
    }
}
