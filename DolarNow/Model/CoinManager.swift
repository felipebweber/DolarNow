//
//  CoinManger.swift
//  DolarNow
//
//  Created by Felipe Weber on 13/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import Foundation

final class CoinManager {
    let coinURL = "https://economia.awesomeapi.com.br/json/all"
    
    func fetchCoin() {
        performCoin(with: coinURL)
    }
    
    func performCoin(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        print(url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { [weak self] (data, _, error) in
            if error != nil {
                print(error!)
                return
            }
            if let data = data {
                if let coin = self?.parseJSON(data) {
                    print("Sucesso")
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(_ coinData: Data) -> [CoinModel?] {
        var coinModel = [CoinModel]()
        guard let json = try? JSONSerialization.jsonObject(with: coinData, options: []) else { return [nil] }
        
        guard let dictionary = json as? [String: AnyObject] else { return [nil] }
        print(dictionary)
        for (key, value) in dictionary {
            guard let val = value["ask"] as? String else { return [nil] }
            print(key)
            print(val)
            let add = CoinModel(coin: key, ask: val)
            coinModel.append(add)
        }
        return [nil]
    }
}
