//
//  ViewController.swift
//  NewsApi
//
//  Created by Apple on 14/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage


class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_articles_author.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! NewsTableViewCell
        cell.lblauthor.text = arr_articles_author[indexPath.row]
        cell.lblTitle.text = arr_articles_title[indexPath.row]
        cell.lblDescription.text = arr_articles_description[indexPath.row]
        cell.lblpublishedAt.text = arr_articles_publishedAt[indexPath.row]
        cell.lblcontent.text = arr_articles_content[indexPath.row]
        cell.lblurl.text = arr_articles_url[indexPath.row]
        cell.layer.backgroundColor = UIColor.black.cgColor;
        let url = URL(string: arr_articles_urlToImage[indexPath.row])
        cell.myimageview.af.setImage(withURL: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 294
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("---------------")
        if  let main = storyboard?.instantiateViewController(identifier: "DVC") as? DetailsViewController{
            main.author = arr_articles_author[indexPath.row]
            main.content = arr_articles_content[indexPath.row]
            main.publishedAt = arr_articles_publishedAt[indexPath.row]
            // main.Description = arr_articles_description[indexPath.row]
            main.Titie = arr_articles_title[indexPath.row]
            main.url = arr_articles_url[indexPath.row]
            main.imageview = arr_articles_urlToImage[indexPath.row]
            //self.present(main, animated: true);
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
    

    @IBOutlet weak var NewsApiTableView: UITableView!
    var arr_articles_urlToImage = [String]()
    var arr_articles_author = [String]()
    var arr_articles_title = [String]()
    var arr_articles_description = [String]()
    var arr_articles_publishedAt = [String]()
    var arr_articles_content = [String]()
    var arr_articles_url = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API_News()
        NewsApiTableView.dataSource = self
        NewsApiTableView.delegate = self
        self.navigationItem.leftBarButtonItems = []
        self.navigationItem.hidesBackButton = true
    }

    func API_News(){
      let url = //"https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=91c1dcfe983541e5976a655b4f95564d"
                //"https://newsapi.org/v2/everything?q=apple&from=2023-12-25&to=2023-12-25&sortBy=popularity&apiKey=91c1dcfe983541e5976a655b4f95564d"
                //"https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=91c1dcfe983541e5976a655b4f95564d"
            //"https://newsapi.org/v2/everything?domains=wsj.com&apiKey=91c1dcfe983541e5976a655b4f95564d"
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=91c1dcfe983541e5976a655b4f95564d"
        
        AF.request(url).responseJSON{(response) in
            switch response.result{
            case .success:
                print(response.result)
                
                let myresult = try? JSON(data: response.data!)
                
                let resultArray = myresult!["articles"]
            
                
               self.arr_articles_urlToImage.removeAll()
                self.arr_articles_author.removeAll()
                self.arr_articles_title.removeAll()
                self.arr_articles_description.removeAll()
                self.arr_articles_publishedAt.removeAll()
                self.arr_articles_content.removeAll()
                self.arr_articles_url.removeAll()
             
                for i in resultArray.arrayValue{
                    
                    
                    let author = i["author"].stringValue
                    self.arr_articles_author.append(author)
                    
                    let title = i["title"].stringValue
                    self.arr_articles_title.append(title)
                    
                    let description = i["description"].stringValue
                    self.arr_articles_description.append(description)
                    
                    let publishedAt = i["publishedAt"].stringValue
                    self.arr_articles_publishedAt.append(publishedAt)
                    
                    let content = i["content"].stringValue
                    self.arr_articles_content.append(content)
                    
                    let urlToImage = i["urlToImage"].stringValue
                    self.arr_articles_urlToImage.append(urlToImage)
                    
                    let url = i["url"].stringValue
                    self.arr_articles_url.append(url)
                    
                    print(author)
                    print(title)
                    print(description)
                    print(publishedAt)
                    print(content)
                    print(urlToImage)
                    print(url)
                }
                self.NewsApiTableView.reloadData()
                break
            case .failure:
                break
            }
        }
    }
}

