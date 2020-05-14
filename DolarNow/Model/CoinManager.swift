//
//  CoinManger.swift
//  DolarNow
//
//  Created by Felipe Weber on 13/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate: class {
    func didUpdate(coin: [CoinModel])
}

final class CoinManager {
    let coinURL = "https://economia.awesomeapi.com.br/json/all"
    
    weak var delegate: CoinManagerDelegate?
    
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
                if let coinArray = self?.parseJSON(data) {
                    self?.delegate?.didUpdate(coin: coinArray)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(_ coinData: Data) -> [CoinModel] {
        var coinModel = [CoinModel]()
        
        let decoder = JSONDecoder()
        if let decoderData = try? decoder.decode(CoinDataResponse.self, from: coinData) {
            let usd = CoinModel(coin: decoderData.USD.code, ask: decoderData.USD.ask)
            coinModel.append(usd)
            let cad = CoinModel(coin: decoderData.CAD.code, ask: decoderData.CAD.ask)
            coinModel.append(cad)
            let eur = CoinModel(coin: decoderData.EUR.code, ask: decoderData.EUR.ask)
            coinModel.append(eur)
            let gbp = CoinModel(coin: decoderData.GBP.code, ask: decoderData.GBP.ask)
            coinModel.append(gbp)
            let ars = CoinModel(coin: decoderData.ARS.code, ask: decoderData.ARS.ask)
            coinModel.append(ars)
            let jpy = CoinModel(coin: decoderData.JPY.code, ask: decoderData.JPY.ask)
            coinModel.append(jpy)
            let chf = CoinModel(coin: decoderData.CHF.code, ask: decoderData.CHF.ask)
            coinModel.append(chf)
            let aud = CoinModel(coin: decoderData.AUD.code, ask: decoderData.AUD.ask)
            coinModel.append(aud)
            let cny = CoinModel(coin: decoderData.CNY.code, ask: decoderData.CNY.ask)
            coinModel.append(cny)
            let ils = CoinModel(coin: decoderData.ILS.code, ask: decoderData.ILS.ask)
            coinModel.append(ils)
        }
        
//        1-USD
//        2-CAD
//        3-EUR
//        4-GBP
//        5-ARS
//        6-JPY
//        7-CHF
//        8-AUD
//        9-CNY
//        10-ILS
//        guard let json = try? JSONSerialization.jsonObject(with: coinData, options: []) else { return [nil] }
//        guard let dictionary = json as? [String: AnyObject] else { return [nil] }
//        print(dictionary)
//        for (key, value) in dictionary {
//            guard let val = value["ask"] as? String else { return [nil] }
//            let add = CoinModel(coin: key, ask: val)
//            coinModel.append(add)
//        }
        
        for i in coinModel {
            print("Coin: \(i.coin) ASK: \(i.ask)")
        }
        
        return coinModel
    }
}
