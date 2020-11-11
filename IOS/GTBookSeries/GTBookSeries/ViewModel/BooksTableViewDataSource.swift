//
//  BooksTableViewDataSource.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import UIKit

class BooksTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
}
