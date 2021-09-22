//
//  GetCurrencyExchangeInformation.swift
//  currencyExchange
//
//  Created by Abdul Nasir Khan on 9/19/21.
//

import Foundation
struct GetCurrencyExchangeInformation {
   static let shared = GetCurrencyExchangeInformation()
    func currencyInformation(url:String,completion:@escaping([DataModel]?,Error?)->()){
       
        NetWorkServiceCall.shared.networkCall(url: url){result in
            switch result{
            case .success(let data):
                do{
                    let jsondecoder = try JSONDecoder().decode([DataModel].self, from: data as! Data)
                    DispatchQueue.main.async {
                        completion(jsondecoder,nil)
                    }
                    print("data received")
                }
                catch{
                    completion(nil,error)
                    print("error in decoer")
                  }
            case .failure(let error):
                completion(nil,error)
                print("error in network")
            }
        }
    }
}
