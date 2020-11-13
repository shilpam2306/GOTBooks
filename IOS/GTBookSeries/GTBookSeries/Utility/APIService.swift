//
//  APIService.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import Foundation

class APIService :  NSObject {

    func apiToGetBooksData(sourcesURL : URL , completion : @escaping ([GTBooksData]) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if data != nil && error == nil {
                do {
                    let decoder = JSONDecoder()
                     //Decode JSON Response Data
                    let model = try decoder.decode([GTBooksData].self, from:
                        data!)
                    completion(model)
                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
        }.resume()
    }
    
    
    func apiToGetCharactersData(sourcesURL : URL , completion : @escaping (GTCharactersData) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                do {
                    //Here dataResponse received from a network request
                    let decoder = JSONDecoder()
                    //Decode JSON Response Data
                    let model = try decoder.decode(GTCharactersData.self, from:
                                 data)
                    completion(model)
                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
        }.resume()
    }
}
