//
//  ComplaintModel.swift
//  Baboons
//
//  Created by Pritam on 03/01/19.
//  Copyright © 2019 parihar. All rights reserved.
//

import UIKit

struct ComplaintModel {
    
    var complainant_name : String = ""
    var complainant_number : String = ""
    var date_time : String = ""
    var engineer_contact_no : String = ""
    var engineer_name : String = ""
    var estimated_date_visit : String = ""
    var request_description : String = ""
    var request_title : String = ""
    var resolution_description : String = ""
    var resolution_title : String = ""
    var status : String = ""
    var tid : Int = 0
    
    init(_ json : NSDictionary) {
        if let complainant_name = json.value(forKey: "complainant_name") as? String{
            self.complainant_name = complainant_name
        }
        if let complainant_number = json.value(forKey: "complainant_number") as? String{
            self.complainant_number = complainant_number
        }
        if let date_time = json.value(forKey: "date_time") as? String{
            self.date_time = date_time
        }
        if let engineer_contact_no = json.value(forKey: "engineer_contact_no") as? String{
            self.engineer_contact_no = engineer_contact_no
        }
        if let engineer_name = json.value(forKey: "engineer_name") as? String{
            self.engineer_name = engineer_name
        }
        if let estimated_date_visit = json.value(forKey: "estimated_date_visit") as? String{
            self.estimated_date_visit = estimated_date_visit
        }
        if let request_description = json.value(forKey: "request_description") as? String{
            self.request_description = request_description
        }
        if let request_title = json.value(forKey: "request_title") as? String{
            self.request_title = request_title
        }
        if let resolution_description = json.value(forKey: "resolution_description") as? String{
            self.resolution_description = resolution_description
        }
        if let resolution_title = json.value(forKey: "resolution_title") as? String{
            self.resolution_title = resolution_title
        }
        if let status = json.value(forKey: "status") as? String{
            self.status = status
        }
        if let tid = json.value(forKey: "tid") as? Int{
            self.tid = tid
        }
    }
    
}
