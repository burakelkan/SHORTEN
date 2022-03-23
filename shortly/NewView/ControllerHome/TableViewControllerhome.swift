//
//  TableViewControllerhome.swift
//  shortly
//
//  Created by yusuf Burak elkan on 13.03.2022.
//

import UIKit

class TableViewControllerhome: UITableViewController {
    @IBOutlet weak var viewhome: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var koseButton: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        
        koseButton.layer.cornerRadius = koseButton.frame.size.width/2
        viewhome.layer.cornerRadius = 35
        viewhome.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.1065298393, green: 0.4696429968, blue: 0.584368825, alpha: 1)
    }
    //Ekran boyutuna göre Hizalama
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
