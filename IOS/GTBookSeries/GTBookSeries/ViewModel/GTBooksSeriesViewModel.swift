//
//  GTBookSeriesViewModel.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import UIKit

//protocol GTBooksSeriesViewModelDelegate {
//    func dataFound(data : [GTBooksData])
//}

class GTBooksSeriesViewModel: NSObject {
    
    //var delegate : GTBooksSeriesViewModelDelegate?
    private var apiService : APIService?
    let group = DispatchGroup()
    let sourcesURL = URL(string: "https://anapioficeandfire.com/api/books/")

    private(set) var empData : [GTBooksData]! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
       self.group.enter()
        self.apiService?.apiToGetBooksData(sourcesURL: sourcesURL!) { (empData) in
            self.empData = empData
            //self.delegate?.dataFound(data: self.empData)
            
       }
        self.group.leave()
    }

}
