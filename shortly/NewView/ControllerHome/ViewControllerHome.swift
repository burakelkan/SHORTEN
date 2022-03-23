//
//  ViewControllerHome.swift
//  shortly
//
//  Created by yusuf burak elkan on 19.03.2022.
//

import UIKit

class ViewControllerHome: UIViewController {

    @IBOutlet weak var ustView: UIView!
    @IBOutlet weak var altView: UIView!
    @IBOutlet weak var baslaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ustView.layer.cornerRadius = 90
        altView.layer.cornerRadius = 140
        baslaButton.layer.cornerRadius = 30
    }
}
