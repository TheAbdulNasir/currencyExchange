//
//  NetworkServiceCall.swift
//  currencyExchange
//
//  Created by Abdul Nasir Khan on 9/19/21.
//

import Foundation
struct NetWorkServiceCall {
    static let shared = NetWorkServiceCall()
    func networkCall(url:String,completion:@escaping(Result<Any?,Error>)->()){
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url){data,response,error in
            if let error = error{
                completion(.failure(error))
           print(error)
            
            }
            if let data = data {
               print("dara received")
                print(data)
                completion(.success(data))
            }
        }.resume()
    }
}
