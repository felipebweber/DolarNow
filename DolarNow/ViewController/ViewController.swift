//
//  ViewController.swift
//  DolarNow
//
//  Created by Felipe Weber on 12/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit

struct CustomData {
    var coinCell: String
    var flagImage: UIImage
}

class ViewController: UIViewController, UICollectionViewDelegate {
    
    var coinManager = CoinManager()
    var tempCoinModel = [CoinModel]()
    
    fileprivate let data = [
        CustomData(coinCell: "$", flagImage: #imageLiteral(resourceName: "united-states-of-america-flag-medium")),
        CustomData(coinCell: "$", flagImage: #imageLiteral(resourceName: "canada-flag-medium")),
        CustomData(coinCell: "€", flagImage: #imageLiteral(resourceName: "euro")),
        CustomData(coinCell: "£", flagImage: #imageLiteral(resourceName: "united-kingdom-flag-medium")),
        CustomData(coinCell: "$", flagImage: #imageLiteral(resourceName: "argentina-flag-medium")),
        CustomData(coinCell: "¥", flagImage: #imageLiteral(resourceName: "japan-flag-medium")),
        CustomData(coinCell: "$", flagImage: #imageLiteral(resourceName: "switzerland-flag-medium")),
        CustomData(coinCell: "A$", flagImage: #imageLiteral(resourceName: "australia-flag-medium")),
        CustomData(coinCell: "¥", flagImage: #imageLiteral(resourceName: "china-flag-medium")),
        CustomData(coinCell: "₪", flagImage: #imageLiteral(resourceName: "israel-flag-medium"))
    ]

    @IBOutlet weak var collectionViewDolarNow: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewDolarNow.dataSource = self
        collectionViewDolarNow.delegate = self
        coinManager.delegate = self
        coinManager.fetchCoin()
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempCoinModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewDolarNow.dequeueReusableCell(withReuseIdentifier: "dolarCollectionViewCell", for: indexPath) as! DolarNowCollectionViewCell
        cell.coinValueLabel.text = tempCoinModel[indexPath.row].ask
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

extension ViewController: CoinManagerDelegate {
    func didUpdate(coin: [CoinModel]) {
        DispatchQueue.main.async {
            self.tempCoinModel = coin
            self.collectionViewDolarNow.reloadData()
        }
    }
}
