//
//  ViewControllerTwopages.swift
//  shortly
//
//  Created by yusuf Burak elkan on 19.03.2022.
//

import UIKit

class ViewControllerTwopages: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var ustView: UIView!
    @IBOutlet var altView: UIView!
    
    var introductoryfile = [collection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        collectionView.delegate = self
        collectionView.dataSource = self
        CollectionList()

        ustView.layer.cornerRadius = 100
        altView.layer.cornerRadius = 90
        nextButton.layer.cornerRadius = 15
    }
    //Collection listeleme verileri
    func CollectionList(){
        let introductoryOne = collection(amblem: "amblem", title: "Marka tanıma", introductoryText: "Her tıklama ile marka bilinirliğinizi artırır. Genel bağlantılar hiçbir şeyi inlemez. Markalı bağlantılar, içeriğinize güven aşılamaya yardımcı olur.")
        let introductoryTwo = collection(amblem: "amblem", title: "Detaylı Kayıtlar", introductoryText: "Bağlantılarınızı kimin tıkladığına dair içgörüler edinin. İnsanların içeriğinizle ne zaman ve nerede etkileşim kurduğunu bilmek, daha iyi kararlar almanızı sağlar.")
        let introductoryThree = collection(amblem: "amblem", title: "Tamamen Özelleştirilebilir", introductoryText: "İzleyici katılımını güçlendiren özelleştirilebilir bağlantılar aracılığıyla marka bilinirliğini ve içerik keşfedilebilirliğini geliştirin")
        
        introductoryfile.append(introductoryOne)
        introductoryfile.append(introductoryTwo)
        introductoryfile.append(introductoryThree)
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
extension ViewControllerTwopages:UICollectionViewDataSource,UICollectionViewDelegate{
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

