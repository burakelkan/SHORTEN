//
//  ViewControllerlinkList.swift
//  shortly
//
//  Created by yusuf Burak elkan on 14.03.2022.
//

import UIKit
import SwiftyJSON
import Alamofire
import CoreLocation
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
class ViewControllerlinkList: UIViewController{

    @IBOutlet weak var textfield: UITextField!
    var linkListen = [linkList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dokunmaalgilama()
}
    func dokunmaalgilama(){
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
}
    //Servis Bağlantısı
    func request(){
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: "https://api.shrtco.de/v2/shorten?url=\(textfield.text!)")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          semaphore.signal()
            let json = JSON(data)
            let error = json["error"]
            let error_code = json["error_code"]
            let jsonResult = json["result"]
            let shortLink = jsonResult["short_link"]
            
        switch error_code{
            
                case .null:
            //Kısatılmış link Kopyalama
                    let alertController = UIAlertController(title: "SHORTLY", message: "https://\(shortLink)", preferredStyle: .alert)
                    let tamamAction = UIAlertAction(title: "Copy", style: .default){
                        action in
                        UIPasteboard.general.string = alertController.message
                        self.view.endEditing(true)
                    }
                    alertController.addAction(tamamAction)
            DispatchQueue.main.async(execute: {
            self.present(alertController, animated: true)
             })
                    
                default:
                    break
               }
            //Hata Kodları
                let alertController = UIAlertController(title: "SHORTLY", message: "\(error)", preferredStyle: .alert)
            let tamamAction = UIAlertAction(title: "Back", style: .default){
                action in
            }
            alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
    }
        task.resume()
        semaphore.wait()
        view.endEditing(true)
}
    
    @IBAction func shortenIt(_ sender: Any) {
         request()
    }
    //Klavye-Dokunma/Algılama
  @objc func dokunmaAlgilamaMetod(){
         view.endEditing(true)
    }
}

