//
//  ViewController.swift
//  test
//
//  Created by tina on 27/2/2018.
//  Copyright © 2018 tina. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var input1: UITextField!
    
    
    @IBAction func tina(_ sender: UIButton) {
        // url request
        let requestURL = "https://iodine.herokuapp.com/asset/info/"+input1.text!
        Alamofire.request(requestURL).responseJSON { (response) in
            if let JSON = response.result.value{
                let parsedJSON = JSON as! NSDictionary
                print(JSON)
                
                //example if there is an id
                let asset = parsedJSON.object(forKey: "asset")!
                let avail = (asset as AnyObject).object(forKey: "avail")!
                let condition = (asset as AnyObject).object(forKey: "condition")!
                let holder = (asset as AnyObject).object(forKey: "holder")!
                let id = (asset as AnyObject).object(forKey: "id")!
                let name = (asset as AnyObject).object(forKey: "name")!
                let publisher = (asset as AnyObject).object(forKey: "publisher")!

                self.label1.text = """
                avail: \(avail)
                condition: \(condition)
                holder: \(holder)
                ID: \(id)
                name: \(name)
                publisher: \(publisher)
                """

                
            }
        }
    }
    
    
    
}

