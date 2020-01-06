//
//  BGColorViewController.swift
//  Yandex
//
//  Created by Mac on 05/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class BGColorViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = false
//               navigationController?.value(forKey: "Background Color")

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 5
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  let defaults = UserDefaults.standard
          let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! BGColorCell
        cell.colorView.layer.cornerRadius = 25.0
        
          switch indexPath.row {
          case 0:
            cell.colorLbl.text = "Default"
            cell.colorView.backgroundColor = UIColor.clear
              print("first case ")
         //   defaults.set("", forKey: "keyOne")
              case 1:
             //   defaults.set("black", forKey: "keyOne")
                  cell.colorLbl.text = "black"
                cell.colorView.backgroundColor = UIColor.black
                        
              case 2:
              //  defaults.set("red", forKey: "keyOne")
                  cell.colorLbl.text = "red"
                cell.colorView.backgroundColor = UIColor.red
                         
              case 3:
             //   defaults.set("white", forKey: "keyOne")
                  cell.colorLbl.text = "green"
             cell.colorView.backgroundColor = UIColor.green
                         
              case 4:
              //  defaults.set("red", forKey: "keyOne")
                  cell.colorLbl.text = "blue"
                        cell.colorView.backgroundColor = UIColor.blue
          default:
           // defaults.set("", forKey: "keyOne")
            
              print(" no data found ")
          }
          
          return cell
          
      }
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let defaults = UserDefaults.standard
        switch indexPath.row {
            
                 case 0:

                     print("first case ")
                   defaults.set("", forKey: "keyOne")
                     case 1:
                       defaults.set("black", forKey: "keyOne")
                               
                     case 2:
                       defaults.set("red", forKey: "keyOne")
                                
                     case 3:
                       defaults.set("green", forKey: "keyOne")
                                
                     case 4:
                       defaults.set("blue", forKey: "keyOne")
                 default:
                   
                     print(" no data found ")
                 }
        //self.navigationController?.popToRootViewController(animated: true)
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         self.navigationController?.pushViewController(controller, animated:true)
//
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
