//
//  GTBooksSeriesViewController.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//
import Foundation
import UIKit

class GTCharactersListViewController: UIViewController {
    
    private var cellIdentifier : String?
    var items : [GTCharactersData]?
    var itemsChr : [String]?
    var isNewDataLoading = false
    @IBOutlet weak var charactersTableView: UITableView!
     
    private var charactersViewModel : GTCharactersViewModel!
    var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
         super.viewDidLoad()
         title = "Characters List"
         progressView()
         callToViewModelForUIUpdate()
         charactersTableView.delegate = self
         charactersTableView.dataSource = self
         //charactersTableView.rowHeight = UITableView.automaticDimension
         //charactersTableView.estimatedRowHeight = UITableView.automaticDimension
         self.charactersTableView.tableFooterView = UIView()
    }
    
    func progressView() {
        indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
     
     func callToViewModelForUIUpdate(){
        self.indicator.startAnimating()
        self.charactersViewModel = GTCharactersViewModel(itemsChr ?? [])
         self.charactersViewModel.bindCharactersViewModelToController = {
             DispatchQueue.main.async {
                self.indicator.stopAnimating()
                 self.items = self.charactersViewModel.ctrAr
                 self.charactersTableView.reloadData()
                 
             }
         }
    
     }

    //Pagination
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == charactersTableView{

            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
            {
                if !isNewDataLoading{
                   self.isNewDataLoading = true
                   //callToViewModelForUIUpdate()
                    
                }
            }
        }

    }
    
}
// MARK : TableView Dellegates
extension GTCharactersListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         items?.count ?? 0
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "GTCharactersListTableViewCell", for: indexPath) as! GTCharactersListTableViewCell
         
         let item = self.items?[indexPath.row]
         
        cell.lblCharacters.text = "Characters : " + (item?.name ?? "")
        cell.lbltitles.text = "Title : " + (item?.titles[0] ?? "")
        cell.lblCulture.text = "Gender : " + (item?.gender ?? "")
        cell.lblBorn.text = "Born : " + (item?.born ?? "")
         return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130.0
    }
}






