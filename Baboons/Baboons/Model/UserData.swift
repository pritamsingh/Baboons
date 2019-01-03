//
//  UserDataProtocol.swift
//  Baboons
//
//  Created by Pritam on 02/01/19.
//  Copyright © 2019 parihar. All rights reserved.
//

import UIKit

protocol UserDataProtocol {
    var asset : String{get}
    var asset_name : String{get}
    var group_name :String{get}
    var id : Int {get}
    var name : String{get}
    var support_email : String{get}
    var token : String{get}
    var update_password : String{get set}
    var user_type : String{get set}
    var username : String{get}
    
}
struct UserData : UserDataProtocol {
    
    var asset: String = ""
    
    var asset_name: String = ""
    
    var group_name: String = ""
    
    var id: Int = 0
    
    var name: String = ""
    
    var support_email: String = ""
    
    var token: String = "'"
    
    var update_password: String = ""
    
    var user_type: String = ""
    
    var username: String = ""
    
    init(_ jsonDic : NSDictionary) {
        if let asset = jsonDic.value(forKey: "asset") as? String{
            self.asset = asset
        }
        if let assetName = jsonDic.value(forKey: "asset_name") as? String{
        self.asset_name = asset
        }
        
        if let groupName = jsonDic.value(forKey: "group_name") as? String{
        self.group_name = groupName
        }
        if let id = jsonDic.value(forKey: "asset") as? Int{
            self.id = id
        }
            
        if let name = jsonDic.value(forKey: "name") as? String{
        self.name = name
        }
        
        if let supportEmail = jsonDic.value(forKey: "support_email") as? String{
        self.support_email = supportEmail
        }
            
        if let token = jsonDic.value(forKey: "token") as? String{
            self.token = token
        }
        
        if let userType = jsonDic.value(forKey: "user_type") as? String{
            self.user_type = userType
        }
            
        if let username = jsonDic.value(forKey: "username") as? String{
        self.username = username
        }
    }
}
