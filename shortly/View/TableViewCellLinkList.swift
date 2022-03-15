//
//  TableViewCellLinkList.swift
//  shortly
//
//  Created by halil ibrahim Elkan on 14.03.2022.
//

import UIKit

class TableViewCellLinkList: UITableViewCell {

    @IBOutlet weak var originalLink: UILabel!
    @IBOutlet weak var shortLink: UILabel!
    
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
