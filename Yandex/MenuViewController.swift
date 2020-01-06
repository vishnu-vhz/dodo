//
//  MenuViewController.swift
//  Yandex
//
//  Created by Mac on 04/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! menuCell
        switch indexPath.row {
        case 0:
            cell.nameLbl.text = "Change Backgrount"
            print("first case ")
            case 1:
                cell.nameLbl.text = "Password Manager"
                       print("Password Manager")
            case 2:
                cell.nameLbl.text = "About"
                       print("About ")
            case 3:
                cell.nameLbl.text = "Contact us "
                       print("Contact us ")
            case 4:
                cell.nameLbl.text = "Help"
                       print("Help ")
        default:
            print(" no data found ")
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let controller =  self.storyboard?.instantiateViewController(withIdentifier: "BGController") as! BGColorViewController
        
        switch indexPath.row {
            
        case 0:
                           self.navigationController?.pushViewController(controller, animated:true)
        default: break
        

                                 }
        
    }
    

    @IBOutlet weak var menuTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  self.navigationController?.navigationBar.isHidden = false
       // navigationController?.value(forKey: "Settings")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
