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
    @IBOutlet weak var showCurrencyRate: UILabel!
    @IBOutlet weak var currencyNameTextField: UITextField!
    var holder:[DataModel] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
       currencyUpdateCall()
       
       
    }
    func currencyUpdateCall(){
        GetCurrencyExchangeInformation.shared.currencyInformation(url:urlOfCurrencyExchange.url.rawValue) { data,error in
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
    
   
    @IBAction func convertCurrencyButton(_ sender: UIButton) {
      // let currency = holder
        for x in holder {
           print(x)
            if currencyNameTextField.text == x.currency{
               print(x.currency)
                showCurrencyRate.text = x.rate
            }
        }
    
    }
}
    


