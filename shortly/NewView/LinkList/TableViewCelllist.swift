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
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var copyalert: UILabel!
    
    var isActive:Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        copyalert.text = "Kopyala"
        copyButton.layer.cornerRadius = 5
        
    }
    @IBAction func button(_ sender: UIButton) {
        
        copyalert.text = "kopyalandı!😎"
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                            self.copyalert.isHidden = false
                        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
