//
//  WebViewController.swift
//  Yandex
//
//  Created by Mac on 03/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    var loadUrl =  "www.google.com" 
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var searchTf: UITextField!
    
    
        override func viewDidLoad() {
            self.navigationController?.navigationBar.isHidden = true
            searchTf.text = loadUrl
            super.viewDidLoad()
           let url = URL(string: loadUrl)!
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
    }

    @IBAction func searchAction(_ sender: Any) {
        let urlbtn = searchTf.text
        loadUrl = urlbtn ?? ""
        let url = URL(string: loadUrl)!
                   webView.load(URLRequest(url: url))
                   webView.allowsBackForwardNavigationGestures = true
        
    
    }
    @IBAction func leftAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
