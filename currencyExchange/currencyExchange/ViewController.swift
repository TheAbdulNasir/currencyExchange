//
//  ViewController.swift
//  currencyExchange
//
//  Created by Abdul Nasir Khan on 9/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showCurrency: UILabel!
    @IBOutlet weak var showRate: UILabel!
    @IBOutlet weak var showTimestemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       currencyUpdateCall()
            
        }
    func currencyUpdateCall(){
        GetCurrencyExchangeInformation.shared.currencyInformation(url:"https://api.nomics.com/v1/exchange-rates?key=5ef30835a93ce9d5a4e98abe2df472ef24d428cf") { data,error in
            guard let data = data else {return}
            for x in data {
                if x.currency == x.currency && x.rate == x.rate && x.timestamp == x.timestamp {
                    self.showCurrency.text = x.currency
                    self.showRate.text = x.rate
                    self.showTimestemp.text = x.timestamp
                }
            }
        }
    }
}


