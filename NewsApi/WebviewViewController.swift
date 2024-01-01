//
//  WebviewViewController.swift
//  NewsApi
//
//  Created by Apple on 23/10/23.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController,WKNavigationDelegate {
    @IBOutlet weak var MyNewsWebview: WKWebView!
    var WebURL: URL?
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.leftBarButtonItems = []
//        self.navigationItem.hidesBackButton = true
        if let weburl = WebURL {
            MyNewsWebview.load(URLRequest(url: weburl))
        }
    }

}

    
   

    
  
