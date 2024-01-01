//
//  DetailsViewController.swift
//  NewsApi
//
//  Created by Apple on 05/10/23.
//

import UIKit
import AlamofireImage


class DetailsViewController: UIViewController {

    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblPublishedAt: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    @IBOutlet weak var myimageview: UIImageView!
    var author:String = ""
    var Titie = ""
   // var Description = ""
    var url = ""
    var publishedAt:String = ""
    var content:String = ""
    var imageview:String = ""
    
  
    @IBOutlet weak var lblurl: UILabel!
    @IBAction func Readmore(_ sender: Any) {
            
        if let web = lblurl.text, let url = URL(string: web) {
                    let VC = storyboard?.instantiateViewController(withIdentifier: "WebviewViewController") as! WebviewViewController
                    VC.WebURL = url
                    self.navigationController?.pushViewController(VC, animated: true)
                }
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.leftBarButtonItems = []
//        self.navigationItem.hidesBackButton = true
        lblurl.text = self.url
        lblAuthor.text = self.author
        lblTitle.text = self.Titie
       //lblDescription.text = self.Description
        lblPublishedAt.text = self.publishedAt
        lblContent.text = self.content
        lblurl.isHidden = true
        let url = URL(string: imageview)
        self.myimageview.af.setImage(withURL: url!)
        myimageview.layer.cornerRadius = 20
        
    }

}
