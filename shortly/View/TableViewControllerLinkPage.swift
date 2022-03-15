//
//  TableViewControllerLinkPage.swift
//  shortly
//
//  Created by halil ibrahim Elkan on 14.03.2022.
//

import UIKit
import SwiftyJSON
import Alamofire

class TableViewControllerLinkPage: UITableViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableViewLinkListen: UITableView!
    
  //
    
   
    
    var linkListen = [linkList]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        var apı = "https://api.shrtco.de/v2/shorten?url=\(textfield)"
        tableViewLinkListen.dataSource = self
        tableViewLinkListen.delegate = self
        
//        self.tableViewLinkListen.register(UITableViewCell.self, forCellWithReuseIdentifier: "ls")
        
        self.requestt() { [self] (shortLink, originalLink) in
           
            for shortLink in originalLink {
            // Anasayfa TableView
                let linkListen1 = linkList(originalLink: "\(String(describing: shortLink))", shortLink: "\(String(describing: originalLink))")
            
                linkListen.append(linkListen1)
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return linkListen.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gonderigelen = linkListen[indexPath.row]
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ls", for: indexPath) as! TableViewCellLinkList
       
        cell.shortLink.text = "\(gonderigelen.shortLink!) "
//        cell.originalLink.text = "\( gonderigelen.originalLink!)"
        cell.indexPath = indexPath
        return cell
    }
    
    func requestt(completion: @escaping ((String, String) -> Void)){
    
        var semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: "https://api.shrtco.de/v2/shorten?url=grisoftbilisim.com.tr")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
            let json = JSON(data)
            let jsonResult = json["result"]
            let shortLink = jsonResult["short_link"]
            let originalLink = jsonResult["original_link"]
            
            completion(shortLink.rawValue as! String, originalLink.rawValue as! String)
            
            print("burakkkkkkkkkk: \(json)")
            print("------------")
            print(shortLink)
        }
        task.resume()
        semaphore.wait()
    }
}
