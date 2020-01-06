//
//  ViewController.swift
//  Yandex
//
//  Created by Mac on 27/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate,UIScrollViewDelegate{
    
    @IBOutlet weak var dodoIcon: UIImageView!
    @IBOutlet weak var newsImg1: UIImageView!
    @IBOutlet weak var newsView1: UIView!
    @IBOutlet weak var newsImg2: UIImageView!
    @IBOutlet weak var newsView3: UIView!
    @IBOutlet weak var newsImg3: UIImageView!
    @IBOutlet weak var newsView2: UIView!
    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var myTextFiled: UITextField!
    //  @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var newsConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var collectionTop: NSLayoutConstraint!
    @IBOutlet weak var scrool1: UIScrollView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var topConst: NSLayoutConstraint!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var upBtn: UIButton!
    
    
    var countSwipe = 0
    var countScrool = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upBtn.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        self.newsImg1.layer.cornerRadius = 8.0
        self.newsImg2.layer.cornerRadius = 8.0
        self.newsImg3.layer.cornerRadius = 8.0
        
        self.myTextFiled.delegate = self
        self.scrool1.delegate = self
        
        searchView.layer.cornerRadius = 10.0
        searchBtn.layer.cornerRadius = 7.0
        searchBtn.isHidden = true
        
        newsView1.layer.cornerRadius = 4.0
        newsView1.layer.borderWidth  = 1.0
        newsView2.layer.cornerRadius = 4.0
        newsView2.layer.borderWidth = 1.0
        newsView3.layer.cornerRadius = 4.0
        newsView3.layer.cornerRadius = 1.0
        
    
        
        // swipe animation
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action:#selector(self.respondToSWipeGesture))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view1.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action:#selector(self.respondToSWipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
               self.view1.addGestureRecognizer(swipeDown)
        
        // Do any additional setup after loading the view.
        ///keyboard show
        
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.isHidden = true
        
        
        
        let defaults = UserDefaults.standard
        if let stringOne = defaults.string(forKey: "keyOne") {
            print(stringOne) // Some String Value
            if stringOne == ""{
               let jeremyGif = UIImage.gifImageWithName("11")
                imgView.image = jeremyGif
            }
            else if stringOne == "black"{
                imgView.backgroundColor = UIColor.black
            }
            else if stringOne == "blue"{
                imgView.backgroundColor = UIColor.blue
                
            }
            else if stringOne == "red"{
                imgView.backgroundColor = UIColor.red
                
            }
            else{
                imgView.backgroundColor = UIColor.green
                
            }
    self.navigationController?.popToRootViewController(animated: true)
//            
        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
               NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.collectionTop.constant = -150
               UIView.animate(withDuration: 1.0){
                   self.view.layoutIfNeeded()
                  //self.scrool1.isScrollEnabled = true
               }
        
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
       
        
        
        
        
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: "webView") as! WebViewController
        self.navigationController?.navigationBar.isHidden = false
        controller.loadUrl = myTextFiled.text ?? ""
                                  self.navigationController?.pushViewController(controller, animated:true)

    
    }
    
    
    
    //scroll view animation
    
    
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y < 0) {
            dodoIcon.isHidden = true
             print("up")
            
            self.topConst.constant = 0
                                        UIView.animate(withDuration: 1.0){
                                            self.view.layoutIfNeeded()
                                           self.scrool1.isScrollEnabled = true
                                        }
                           self.collectionTop.constant = -150
                           UIView.animate(withDuration: 1.0){
                               self.view.layoutIfNeeded()
                              //self.scrool1.isScrollEnabled = true
                           }
            
            
            self.newsConstraint.constant = 10.0
            UIView.animate(withDuration: 5.0){
                                                                  self.view.layoutIfNeeded()
                                                              
        }
        }
    
            else
            if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0)  {
                
                self.newsConstraint.constant = 227
                                                                         UIView.animate(withDuration: 0.5){
                                                                             self.view.layoutIfNeeded()
                                                                         
                   }
            dodoIcon.isHidden = false
           print("down")
                
                                                   }
        
        
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y < -100) {
            upBtn.isHidden = false
        }
        else{
            upBtn.isHidden = true
        }
        
           
        }
    
    
    
    
    
    
    
    //keyboard show and dissmiss
    
    @objc func keyboardWillShow(notification: Notification) {
        myTextFiled.text = "https://www."
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    print("notification: Keyboard will show")
        self.topConst.constant = 5.0
        UIView.animate(withDuration: 5.0){
            self.view.layoutIfNeeded()
            self.searchBtn.isHidden = false
        }
        self.collectionTop.constant = -150
        UIView.animate(withDuration: 1.0){
            self.view.layoutIfNeeded()
           //self.scrool1.isScrollEnabled = true
        }
         
    }
    }
    
    
    @objc func keyboardWillHide(notification: Notification) {
         myTextFiled.text = ""
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
  print("notification: Keyboard will hide")
        self.topConst.constant = 0
              UIView.animate(withDuration: 1.0){
                  self.view.layoutIfNeeded()
                  self.searchBtn.isHidden = true
              }
    }
    }
    
    @IBAction func upBtnAction(_ sender: Any) {
        scrool1.willMove(toSuperview: collectioView)
//        self.newsConstraint.constant = 300
//                                                                               UIView.animate(withDuration: 0.5){
//                                                                                   self.view.layoutIfNeeded()
        
//                   self.topConst.constant = 0
//                                               UIView.animate(withDuration: 1.0){
//                                                   self.view.layoutIfNeeded()
//                                                  self.scrool1.isScrollEnabled = true
//                                               }
//                                  self.collectionTop.constant = -150
//                                  UIView.animate(withDuration: 1.0){
//                                      self.view.layoutIfNeeded()
//                                     //self.scrool1.isScrollEnabled = true
//                                  }
        let bottomOffset = CGPoint(x: 0, y: scrool1.contentSize.height - scrool1.bounds.size.height)
        scrool1.setContentOffset(bottomOffset, animated: true)
        
    }
    
    
    
    @IBAction func menuAction(_ sender: Any) {
         let controller =  self.storyboard?.instantiateViewController(withIdentifier: "menuController") as! MenuViewController
                                 self.navigationController?.pushViewController(controller, animated:true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func newsAction(_ sender: Any) {
         let controller =  self.storyboard?.instantiateViewController(withIdentifier: "webView") as! WebViewController
        controller.loadUrl = "https://www.indiatoday.in/india/story/bjp-will-not-move-back-an-inch-on-caa-says-amit-shah-1633668-2020-01-0"
         self.navigationController?.pushViewController(controller, animated:true)//https://www.indiatoday.in/india/story/bjp-will-not-move-back-an-inch-on-caa-says-amit-shah-1633668-2020-01-03
        
    
    }
    
    @IBAction func newsAction2(_ sender: Any) {
        
       let controller =  self.storyboard?.instantiateViewController(withIdentifier: "webView") as! WebViewController
        controller.loadUrl = "https://www.ndtv.com/india-news/north-india-floods-killed-over-1-900-people-this-year-report-2154949"
         self.navigationController?.pushViewController(controller, animated:true)
        
    }
    
    @IBAction func newsAction3(_ sender: Any) {
       
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: "webView") as! WebViewController
              controller.loadUrl = "https://www.ndtv.com/business/bse-sensex-today-live-share-market-updates-sensex-nifty-edge-higher-in-early-trade-january-2-2020-2157472"
               self.navigationController?.pushViewController(controller, animated:true)
              
    }
    
    
    
    
    
    //// swipe gesure function

    @objc func respondToSWipeGesture(gesture :UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                print("swipe up")
                print(countSwipe)
                if countSwipe != 1{
                    
                 
                }
              // collectionTop
               self.topConst.constant = 0
                             UIView.animate(withDuration: 1.0){
                                 self.view.layoutIfNeeded()
                                self.scrool1.isScrollEnabled = true
                             }
                self.collectionTop.constant = -150
                UIView.animate(withDuration: 1.0){
                    self.view.layoutIfNeeded()
                   //self.scrool1.isScrollEnabled = true
                }
                countSwipe -= 1
               
                case UISwipeGestureRecognizer.Direction.down:
                print("swipe down")
                 
              
                self.collectionTop.constant = 255
                UIView.animate(withDuration: 1.0){
                    self.view.layoutIfNeeded()
                  // self.scrool1.isScrollEnabled = true
                }
                
                self.topConst.constant = 255
                               UIView.animate(withDuration: 1.0){
                                   self.view.layoutIfNeeded()
                                self.countSwipe += 1
                                self.scrool1.isScrollEnabled = false
                               }
                print(countSwipe)
                if countSwipe == 1{
               
                }
               
            default:
                print("no move")
            }
        }
        
    }
}

///Collection view


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 9
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
          //  cell.btn.layer.cornerRadius = 90
        cell.layer.cornerRadius = (cell.frame.width/2)
        switch indexPath.row {
            case 0:
             cell.btn.setImage(UIImage.init(named: "amazon"), for: .normal)
    
               case 1:
                cell.btn.setImage(UIImage.init(named: "wiki"), for: .normal)
               case 2:
             cell.btn.setImage(UIImage.init(named: "insta"), for: .normal)
            case 3:
             cell.btn.setImage(UIImage.init(named: "booking"), for: .normal)
            
            case 4:
             cell.btn.setImage(UIImage.init(named: "logo png-1"), for: .normal)
            case 5:
             cell.btn.setImage(UIImage.init(named: "app Icon png-1"), for: .normal)
            case 6:
             cell.btn.setImage(UIImage.init(named: "app icon png-2"), for: .normal)
            case 7:
             cell.btn.setImage(UIImage.init(named: "app Icon png-3"), for: .normal)
            case 8:
                        
             cell.btn.setImage(UIImage.init(named: "youtube"), for: .normal)
           

               default:

                cell.backgroundColor = UIColor.white



               }
        
        
             return cell
       
            
        
    }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let noOfCellsInRow = 3
           
           let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
           
           let totalSpace = flowLayout.sectionInset.left
               + flowLayout.sectionInset.right
               + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
           
           let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
           return CGSize(width: size-20, height: size-20)
       
    
    
    
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: "webView") as! WebViewController
        
        switch indexPath.row {
        case 0:
             self.navigationController?.navigationBar.isHidden = false
                    controller.loadUrl = "https://www.amazon.com/"
                           self.navigationController?.pushViewController(controller, animated:true)
        case 1:
             self.navigationController?.navigationBar.isHidden = false
                       controller.loadUrl = "https://www.wikipedia.org/"
                              self.navigationController?.pushViewController(controller, animated:true)
        case 2:
             self.navigationController?.navigationBar.isHidden = false
                    controller.loadUrl = "https://www.instagram.com/"
                           self.navigationController?.pushViewController(controller, animated:true)
        case 3:
             self.navigationController?.navigationBar.isHidden = false
                    controller.loadUrl = "https://www.booking.com/"
                           self.navigationController?.pushViewController(controller, animated:true)
        case 4:
             self.navigationController?.navigationBar.isHidden = false
                    controller.loadUrl = "https://aboutme.google.com/u/0/?referer=gplus"
                           self.navigationController?.pushViewController(controller, animated:true)
        case 5:
             self.navigationController?.navigationBar.isHidden = false
                    controller.loadUrl = "https://twitter.com/login"
                           self.navigationController?.pushViewController(controller, animated:true)
        case 6:
             self.navigationController?.navigationBar.isHidden = false
                    controller.loadUrl = "https://in.linkedin.com/"
                           self.navigationController?.pushViewController(controller, animated:true)
        case 7:
             self.navigationController?.navigationBar.isHidden = false
                    controller.loadUrl = "https://www.facebook.com/"
                           self.navigationController?.pushViewController(controller, animated:true)
        case 8:
             self.navigationController?.navigationBar.isHidden = false
                               
                    controller.loadUrl = "https://www.youtube.com/"
                           self.navigationController?.pushViewController(controller, animated:true)

       default:
 self.navigationController?.navigationBar.isHidden = false
                       controller.loadUrl = "https://www.youtube.com/"
                              self.navigationController?.pushViewController(controller, animated:true)


                      }
               
        
     

    }
}
