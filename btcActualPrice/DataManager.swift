//
//  DataManager.swift
//  btcActualPrice
//
//  Created by Сергей Кудинов on 08.08.2021.
//

class DataManager {
    static let shared = DataManager()
    
    let url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    let currencys = ["USD" : "💵", "GBP" : "💷", "EUR" : "💶"]
    private init() {}
}
