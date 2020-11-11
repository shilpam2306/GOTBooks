//
//  ViewController.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    private var cellIdentifier : String?
    private var count = 0
    private var items : [GTBooksData]?
    private var itemName : String?
    var indicator: UIActivityIndicatorView!
    @IBOutlet weak var employeeTableView: UITableView!
    
    private var employeeViewModel : GTBooksSeriesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView()
        callToViewModelForUIUpdate()
        employeeTableView.delegate = self
        employeeTableView.dataSource = self
        title = "Game of Thrones Book List"
        self.employeeTableView.tableFooterView = UIView()
    }
    
    func callToViewModelForUIUpdate(){
        self.indicator.startAnimating()
        self.employeeViewModel =  GTBooksSeriesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.items = self.employeeViewModel.empData
                self.employeeTableView.reloadData()
                
            }
        }
    }
    
    func progressView() {
        indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}

// MARK: TableView Dellegates
extension ViewController  : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GTBooksSeriesTableViewCell", for: indexPath) as! GTBooksSeriesTableViewCell
        
        let item = self.items?[indexPath.row]
        if item!.name == "A Game of Thrones" {
           count += 1
           cell.lblBooksId.text = item?.name
        }
//        if item!.name == "George R. R. Martin" {
//           cell.lblBooksId.text = item?.name
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items?[indexPath.row]
        let charactersViewController = self.storyboard?.instantiateViewController(withIdentifier: "GTCharactersListViewController") as! GTCharactersListViewController
        charactersViewController.itemsChr = item?.characters
        self.navigationController?.pushViewController(charactersViewController, animated: true)
    }
}



