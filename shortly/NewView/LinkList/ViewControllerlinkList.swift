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

    @IBOutlet weak var ustView: UIView!
    @IBOutlet weak var altView: UIView!
    @IBOutlet weak var kısaltButton: UIButton!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var stringArr = [String]()
    var kısalt = ""
    let context = appDelegate.persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.isHidden = false
        explanationLabel.isHidden = false
        image.isHidden = false
        kısaltButton.layer.cornerRadius = 5
        ustView.layer.cornerRadius = 90
        altView.layer.cornerRadius = 120
        kısaltButton.layer.cornerRadius = 15
        textfield.layer.cornerRadius = 15
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

            self.kısalt = "\(shortLink)"
            
            print("errroorrrrr=\(error_code)")
            
        switch error_code{
        case "null" :
            self.kısalt = "sadfas"
    case 1:
            let alertController = UIAlertController(title: "SHORTEN", message: "URL Belirtilmedi", preferredStyle: .alert)
            let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                action in
            }
            alertController.addAction(tamamAction)
    DispatchQueue.main.async(execute: {
    self.present(alertController, animated: true)
     })
    case 2:
            if error_code == 2{
                let alertController = UIAlertController(title: "SHORTEN", message: "Geçersiz URL gönderildi", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
                self.kısalt = "Geçersiz URL gönderildi"
            }
    case 3:
                let alertController = UIAlertController(title: "SHORTEN", message: "Hız sınırına ulaşıldı. Bir saniye bekleyin ve tekrar deneyin", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
            self.tableView.isHidden = true
    case 4:
                let alertController = UIAlertController(title: "SHORTEN", message: "Hizmet şartlarımızı ihlal ettiği için IP Adresi engellendi", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
                        
    case 5:
                let alertController = UIAlertController(title: "SHORTEN", message: "shortencode kodu (slug) zaten alınmış/kullanımda", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
            self.tableView.isHidden = true
    case 6:
                let alertController = UIAlertController(title: "SHORTEN", message: "Bilinmeyen hata", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
            self.tableView.isHidden = true
    case 7:
   let alertController = UIAlertController(title: "SHORTEN", message: "Kod belirtilmedi (kod parametresi boş", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
            self.tableView.isHidden = true
    case 8:
                let alertController = UIAlertController(title: "SHORTEN", message: "Geçersiz kod gönderildi kod bulunamadı/böyle bir kısa bağlantı yok", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
            self.tableView.isHidden = true
    case 9:
                let alertController = UIAlertController(title: "SHORTEN", message: "Gerekli parametreler eksik", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
            self.tableView.isHidden = true
    case 10:
                let alertController = UIAlertController(title: "SHORTEN", message: "İzin verilmeyen bir Bağlantıyı kısaltmaya çalışmak. İzin verilmeyen bağlantılar hakkında daha fazla bilgi", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
                    action in
                }
                alertController.addAction(tamamAction)
        DispatchQueue.main.async(execute: {
        self.present(alertController, animated: true)
         })
            self.tableView.isHidden = true
                default:
                    break
    }
}
        task.resume()
        semaphore.wait()
        view.endEditing(true)
}
    @IBAction func deletebutton(_ sender: UIButton) {
       
        let alertController = UIAlertController(title: "SHORTEN", message: "Link Silinecek", preferredStyle: .alert)
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
            action in
            let point = sender.convert(CGPoint.zero, to: self.tableView)
            guard let indexpath = self.tableView.indexPathForRow(at: point) else {return}
            self.stringArr.remove(at: indexpath.row)
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
            self.tableView.endUpdates()
            self.view.endEditing(true)
        }
        let iptalAction = UIAlertAction(title: "Hayır", style: .cancel){
            action in
        }
        alertController.addAction(tamamAction)
        alertController.addAction(iptalAction)
DispatchQueue.main.async(execute: {
self.present(alertController, animated: true)
 })
    }
    @IBAction func kopyala(_ sender: Any) {
        UIPasteboard.general.string = kısalt
    }
    @IBAction func shortenIt(_ sender: Any) {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            self.image.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            self.explanationLabel.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            self.titleLabel.isHidden = true
        }
        request()
        if let txt = textfield.text, !txt.isEmpty {
            self.stringArr.insert(txt, at: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            tableView.endUpdates()
            textfield.text = nil
        }
        if textfield.text!.count == 0{
            textfield.placeholder = "URL belirtilmedi"
        }else if textfield.text!.count >= 1{
            textfield.placeholder = "Burada bir link kısaltın ..."
        }
    }
    //Klavye-Dokunma/Algılama
  @objc func dokunmaAlgilamaMetod(){
         view.endEditing(true)
    }
}

extension ViewControllerlinkList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "linkList", for: indexPath) as? TableViewCelllist else {return UITableViewCell()}
        cell.lbnname.text = stringArr[indexPath.row]
        cell.shorted.text = kısalt
        return cell
    }
}
