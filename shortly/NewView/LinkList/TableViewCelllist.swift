//
//  TableViewCelllist.swift
//  shortly
//
//  Created by yusuf burak elkan on 20.03.2022.
//

import UIKit
import CoreData

class TableViewCelllist: UITableViewCell {

    @IBOutlet weak var lbnname: UILabel!
    @IBOutlet weak var shorted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
