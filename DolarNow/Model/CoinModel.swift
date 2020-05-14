//
//  CoinModel.swift
//  DolarNow
//
//  Created by Felipe Weber on 13/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit

class CoinModel: NSObject {
    let coin: String
    let ask: String
    
    init(coin: String, ask: String) {
        self.coin = coin
        self.ask = ask
    }
}
