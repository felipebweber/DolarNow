//
//  DolarNowCollectionViewCell.swift
//  DolarNow
//
//  Created by Felipe Weber on 12/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit

class DolarNowCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            flagImageView.image = data.flagImage
            coinLabel.text = data.coinCell
        }
    }
}
