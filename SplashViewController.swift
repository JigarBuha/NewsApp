//
//  SplashViewController.swift
//  NewsApi
//
//  Created by Apple on 26/12/23.
//

import UIKit

class SplashViewController: UIViewController {
override func viewDidLoad(){
    super.viewDidLoad()
    perform(#selector(NewsViewController), with: nil, afterDelay: 2.0)
    UIApplication.shared.statusBarStyle = .default
    
}
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
@objc func NewsViewController(){
    let main = UIStoryboard(name: "Main", bundle: nil)
    let home = main.instantiateViewController(withIdentifier: "NewsViewController")
    self.navigationController?.pushViewController(home, animated: true)
    
}
}
