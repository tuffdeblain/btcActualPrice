//
//  Currency.swift
//  btcActualPrice
//
//  Created by Сергей Кудинов on 08.08.2021.
//

struct CryptoPrices: Decodable {
    let chartName: String?
    let bpi: Currencys?
}

struct Currencys: Decodable {
    let USD: Currency?
    let GBP: Currency?
    let EUR: Currency?
}

struct Currency: Decodable {
    let code: String?
    let rate: String?
    let description: String?
}



