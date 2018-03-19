//
//  ViewController.swift
//  test
//
//  Created by tina on 27/2/2018.
//  Copyright © 2018 tina. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func req(requestURL: String){
        Alamofire.request(requestURL).responseJSON { (response) in
            if let JSONOBJ = response.result.value{
                let json = JSON(JSONOBJ)
                
                var text = ""
                for (key,subJson):(String, JSON) in json["asset"] {
                    text += "\(key): \(subJson)\n"
                }
                
                self.label1.text = text
            }
        }
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
        req(requestURL: requestURL)
    }
    
    
    
}

