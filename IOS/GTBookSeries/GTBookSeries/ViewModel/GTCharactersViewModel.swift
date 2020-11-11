//
//  GTCharactersViewModel.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import UIKit

class GTCharactersViewModel: NSObject {

    private var apiService : APIService!
    public var urls = [String]()
    public var ctrAr = [GTCharactersData]()
    let group = DispatchGroup()
    let cache = NSCache<NSString, GTCharactersData>()
    private(set) var chrData : GTCharactersData! {
        didSet {
            self.bindCharactersViewModelToController()
        }
    }
    
    var bindCharactersViewModelToController : (() -> ()) = {}
    
    init(_ chrAr : [String]) {
        super.init()
        self.apiService =  APIService()
        self.urls = chrAr
        self.cacheData()
        
    }

    func callFuncToGetEmpData() {
        
        guard urls.count != 0 else {
            return
        }
        self.group.enter()
        DispatchQueue.global(qos: .background).async {
            for i in self.urls {
            
            guard let url = URL(string: i.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
                    return
            }
            self.apiService.apiToGetCharactersData(sourcesURL: url) { (chrData) in
                self.chrData = chrData
                
                self.ctrAr.append(chrData)
                self.cache.setObject(self.chrData, forKey: "CachedObject")
              
              }
           }
            DispatchQueue.main.async {
                print("This is run on the main queue, after the previous code in outer block")
            }
       }
        
        
        self.group.leave()
    }
    
    func cacheData() {
       if let cachedVersion = cache.object(forKey: "CachedObject") {
            self.ctrAr.append(cachedVersion)
        } else {
            callFuncToGetEmpData()
        }
    }
}
