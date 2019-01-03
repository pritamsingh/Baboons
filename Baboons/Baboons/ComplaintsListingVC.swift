//
//  ComplaintsListingVC.swift
//  Baboons
//
//  Created by Pritam on 02/01/19.
//  Copyright © 2019 parihar. All rights reserved.
//

import UIKit

class ComplaintsListingVC: UIViewController {
    @IBOutlet weak var tableView : UITableView!
    var complaintList = [ComplaintModel](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
  

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let add: UIBarButtonItem = UIBarButtonItem.init(title: "Add", style: .plain, target: self, action: #selector(ComplaintsListingVC.rightButtonAction))
        self.navigationItem.rightBarButtonItem = add
        
        getComlaintsList()
        
    }
    func getComlaintsList(){
        
        let assest = "Uno-24989" // hard coded value to get data
        let status = ""
        let ticket = ""
        let offset = 0
        let postData = NSMutableData()
        postData.append("asset=\(assest)".data(using:String.Encoding.utf8)!)
        postData.append("&ticket=\(ticket)".data(using:String.Encoding.utf8)!)
        postData.append("&status=\(status)".data(using:String.Encoding.utf8)!)
        postData.append("&offset=\(offset)".data(using:String.Encoding.utf8)!)

        
        let url : String =  "http://13.232.35.230/api/complaint/list"
        // requesting for  data using url and post data
//        DispatchQueue.main.async {
    
            Parser(url, postData: postData , handler: { response in
                print(response)
                let  complaints = (response.value(forKeyPath: "data.complaints") as! NSArray)
                for complaint in complaints{
                    self.complaintList.append(ComplaintModel(complaint as! NSDictionary))
                }
                print(self.complaintList)
            })
//        }
        
    }
    @objc func rightButtonAction()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddComplaintVC")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.rightBarButtonItem = nil
    }

}
extension ComplaintsListingVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.complaintList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let complaint = self.complaintList[indexPath.row]
        if let complainant_name = cell.viewWithTag(1) as? UILabel{
            complainant_name.text = complaint.complainant_name
        }
        if let complainant_number = cell.viewWithTag(2) as? UILabel{
            complainant_number.text = complaint.complainant_number
        }
        if let date_time = cell.viewWithTag(3) as? UILabel{
            date_time.text = complaint.date_time
        }
        if let request_description = cell.viewWithTag(4) as? UILabel{
            request_description.text = complaint.request_description
        }
        if let status = cell.viewWithTag(5) as? UILabel{
            status.text = complaint.status
        }
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
