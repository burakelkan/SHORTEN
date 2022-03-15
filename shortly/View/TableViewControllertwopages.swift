//
//  TableViewControllertwo.swift
//  shortly
//
//  Created by yusuf Burak elkan on 13.03.2022.
//

import UIKit

class TableViewControllertwopages: UITableViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var introductoryfile = [collection]()
    //PageControll
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == introductoryfile.count - 1 {
                nextButton.setTitle("Skip", for: .normal)
            } else {
                nextButton.setTitle("Skip", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        CollectionList()
    }
    //Collection listeleme verileri
    func CollectionList(){
        let introductoryOne = collection(amblem: "amblem", title: "Brand Recognition", introductoryText: "Boos your brand recognition with each click. Generic links don't moan a thing.  Branded links help instil confidence in your content.")
        let introductoryTwo = collection(amblem: "amblem", title: "Detailed Records", introductoryText: "Gain insights into who is clicking your links .Knowing when and where people engage with your content holps inform better decisions.")
        let introductoryThree = collection(amblem: "amblem", title: "Fully Customizable", introductoryText: "Improve brand awareness and content discoverability through customizable links supercharging audience engagement")
        
        introductoryfile.append(introductoryOne)
        introductoryfile.append(introductoryTwo)
        introductoryfile.append(introductoryThree)
    }
    //Ekran boyutuna göre Hizalama
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    //Diğer sayfaya geçiş için
    @IBAction func skipbutton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "homePage") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
}
//Collection listeme
extension TableViewControllertwopages:UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return introductoryfile.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let introductory = introductoryfile[indexPath.row]
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! CollectionViewCell
        
        cell.amblem.image = UIImage(named: introductory.amblem!)
        cell.title.text = "\(introductory.title!)"
        cell.introductoryText.text = "\(introductory.introductoryText!)"
        cell.amblem.layer.cornerRadius = 50.0
        return cell
    }
}
