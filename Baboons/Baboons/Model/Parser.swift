//
//  Parser.swift
//  Baboons
//
//  Created by Pritam on 30/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit

class Parser: NSObject {

     init(_ url : String,postData : NSMutableData, handler: @escaping (NSDictionary) -> Void) {
        super.init()
        self.getData(url, postData: postData, handler: handler)
    }
    func getData(_ urlString:String,postData : NSMutableData, handler: @escaping (NSDictionary) -> Void){
        //create the url with NSURL
        let url = URL(string: urlString )!
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
//        let request = URLRequest(url: url)
        let request = NSMutableURLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        if userData?.token != nil {
            request.addValue(userData!.token, forHTTPHeaderField: "token")

        }
        
        request.httpBody = postData as Data
//        do{
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions())
            let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print ("status code = \(statusCode)")
                }
                if let error = error {
                    print ("\(error)")
                }
                if let data = data {
                    do{
                        if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? NSDictionary {
                            print ("data = \(json)")
                            DispatchQueue.main.async {
                                    handler(json)
                                }

                        }
                    }catch _ {
                        print ("OOps not good JSON formatted response")
                    }
                }
            })
            task.resume()
//        }catch _ {
//            print ("Oops something happened buddy")
//        }
        
    }
}
