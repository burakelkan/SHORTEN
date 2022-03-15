//
//  TableViewControllerhome.swift
//  shortly
//
//  Created by yusuf Burak elkan on 13.03.2022.
//

import UIKit

class TableViewControllerhome: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //Ekran boyutuna göre Hizalama
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
