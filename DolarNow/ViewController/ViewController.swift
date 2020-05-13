//
//  ViewController.swift
//  DolarNow
//
//  Created by Felipe Weber on 12/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit

struct CustomData {
    var title: String
    var flagImage: UIImage
}

class ViewController: UIViewController, UICollectionViewDelegate {
    
    fileprivate let data = [
        CustomData(title: "R$", flagImage: #imageLiteral(resourceName: "brazil-flag-medium")),
        CustomData(title: "$", flagImage: #imageLiteral(resourceName: "united-states-of-america-flag-medium")),
        CustomData(title: "€", flagImage: #imageLiteral(resourceName: "euro")),
        CustomData(title: "£", flagImage: #imageLiteral(resourceName: "united-kingdom-flag-medium")),
        CustomData(title: "$", flagImage: #imageLiteral(resourceName: "switzerland-flag-medium")),
        CustomData(title: "$", flagImage: #imageLiteral(resourceName: "argentina-flag-medium")),
        CustomData(title: "¥", flagImage: #imageLiteral(resourceName: "china-flag-medium")),
        CustomData(title: "₪", flagImage: #imageLiteral(resourceName: "israel-flag-medium")),
        CustomData(title: "A$", flagImage: #imageLiteral(resourceName: "australia-flag-medium")),
        CustomData(title: "$", flagImage: #imageLiteral(resourceName: "canada-flag-medium"))
    ]

    @IBOutlet weak var collectionViewDolarNow: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewDolarNow.dataSource = self
        collectionViewDolarNow.delegate = self
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewDolarNow.dequeueReusableCell(withReuseIdentifier: "dolarCollectionViewCell", for: indexPath) as! DolarNowCollectionViewCell
//        cell.coinLabel.text = "Agora vai"
    
        cell.data = self.data[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let withCell = collectionView.bounds.width
        return CGSize(width: withCell, height: 46)
    }
}
