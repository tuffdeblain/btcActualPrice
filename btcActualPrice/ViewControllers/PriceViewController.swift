//
//  ViewController.swift
//  btcActualPrice
//
//  Created by Сергей Кудинов on 08.08.2021.
//

import UIKit

class PriceViewController: UIViewController {

    @IBOutlet weak var chartNameLabel: UILabel!
    
    @IBOutlet weak var emojiUSDLabel: UILabel!
    @IBOutlet weak var currencyUSDDescriptionLabel: UILabel!
    @IBOutlet weak var rateUSDLabel: UILabel!
    
    @IBOutlet weak var emojiGBPLabel: UILabel!
    @IBOutlet weak var currencyGBPDescriptionLabel: UILabel!
    @IBOutlet weak var rateGBPLabel: UILabel!
    
    
    @IBOutlet weak var emojiEURLabel: UILabel!
    @IBOutlet weak var currencyEURDescriptionLabel: UILabel!
    @IBOutlet weak var rateEURLabel: UILabel!
    
    
    private var currencys: CryptoPrices?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCourses()
        
        chartNameLabel.text = currencys?.chartName
        
        rateUSDLabel.text = "$\(currencys?.bpi?.USD?.rate ?? "")"
        currencyUSDDescriptionLabel.text = currencys?.bpi?.USD?.description
        emojiUSDLabel.text = DataManager.shared.currencys[currencys?.bpi?.USD?.code ?? ""]
        
        currencyGBPDescriptionLabel.text = currencys?.bpi?.GBP?.description
        rateGBPLabel.text = "£\(currencys?.bpi?.GBP?.rate ?? "")"
        emojiGBPLabel.text = DataManager.shared.currencys[currencys?.bpi?.GBP?.code ?? ""]
        
        rateEURLabel.text = "€\(currencys?.bpi?.EUR?.rate ?? "")"
        currencyEURDescriptionLabel.text = currencys?.bpi?.EUR?.description
        emojiEURLabel.text = DataManager.shared.currencys[currencys?.bpi?.EUR?.code ?? ""]
    }


}

extension PriceViewController {
    func fetchCourses() {
        guard let url = URL(string: DataManager.shared.url) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error descriprion")
                return
            }
            
           
            do {
                self.currencys = try JSONDecoder().decode(CryptoPrices.self, from: data)
                DispatchQueue.main.async {
                    self.viewDidLoad()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
