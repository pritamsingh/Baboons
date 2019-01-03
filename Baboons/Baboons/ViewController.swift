//
//  ViewController.swift
//  Baboons
//
//  Created by Pritam on 30/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit
var userData : UserData?
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    
    }
    
    @IBAction func loginEvent()  {
        
        let url : String = "http://13.232.35.230/api/user/login"

        
        let userName = "zicom1"
        let password = "aaaaaa"
        let type = "mycs"
        let latitute = "19.2183"
        let longitude = "72.976"
        let imei = "523ttetwt" // just for testing
        let mobileModel = "iphone 7"
        let os = "mac"
        let InstrumentType = "iphone"
        
        let postData = NSMutableData()
        postData.append("username=\(userName)".data(using:String.Encoding.utf8)!)
        postData.append("&password=\(password)".data(using:String.Encoding.utf8)!)
        postData.append("&type=\(type)".data(using:String.Encoding.utf8)!)
        postData.append("&latitude=\(latitute)".data(using:String.Encoding.utf8)!)
        postData.append("&longitude=\(longitude)".data(using:String.Encoding.utf8)!)
        postData.append("&device={imei = \(imei);mobile = \(mobileModel);os = \(os);type = \(InstrumentType);}".data(using:String.Encoding.utf8)!)
      
//        DispatchQueue.main.async {
            // requesting for  data using url and post data
            Parser(url, postData: postData , handler: { response in
                print(response)
                if response.value(forKeyPath: "success") as! Bool {
                    userData = UserData(response.value(forKeyPath: "data") as! NSDictionary)
                    self.navToComplaintList()
                }
                
            })
//        }

    }
   
    func navToComplaintList()  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ComplaintsListingVC")
        self.navigationController?.pushViewController(controller, animated: true)
    }

}


