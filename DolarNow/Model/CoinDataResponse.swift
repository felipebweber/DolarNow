//
//  CoinDataResponse.swift
//  DolarNow
//
//  Created by Felipe Weber on 13/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import Foundation


class CoinDataResponse: Codable {
    let USD: Usd
    let CAD: Cad
    let EUR: Eur
    let GBP: Gbp
    let ARS: Ars
    let JPY: Jpy
    let CHF: Chf
    let AUD: Aud
    let CNY: Cny
    let ILS: Ils
}

extension CoinDataResponse {
    
    struct Usd: Codable {
        let code: String
        let ask: String
    }

    struct Cad: Codable {
        let code: String
        let ask: String
    }

    struct Eur: Codable {
        let code: String
        let ask: String
    }

    struct Gbp: Codable {
        let code: String
        let ask: String
    }

    struct Ars: Codable {
        let code: String
        let ask: String
    }

    struct Jpy: Codable {
        let code: String
        let ask: String
    }

    struct Chf: Codable {
        let code: String
        let ask: String
    }

    struct Aud: Codable {
        let code: String
        let ask: String
    }

    struct Cny: Codable {
        let code: String
        let ask: String
    }

    struct Ils: Codable {
        let code: String
        let ask: String
    }
}

