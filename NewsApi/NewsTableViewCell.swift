//
//  NewsTableViewCell.swift
//  NewsApi
//
//  Created by Apple on 14/08/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
   
    @IBOutlet weak var lblauthor: UILabel!
   
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var BtnWeb: UIButton!
    @IBOutlet weak var lblurl: UILabel!
    @IBOutlet weak var lblpublishedAt: UILabel!
    @IBOutlet weak var lblcontent: UILabel!
    @IBOutlet weak var myimageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myimageview.layer.cornerRadius = 20
        BtnWeb.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
