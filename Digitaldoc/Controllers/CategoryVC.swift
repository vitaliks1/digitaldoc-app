//
//  HomeVC.swift
//  Digitaldoc
//
//  Created by Manoj on 09/03/22.
//

import UIKit

class CategoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var menuObj = [ShelfResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiFor_AppConfiguration()
        tableView.register(UINib(nibName: "CategoryTV", bundle: nil), forCellReuseIdentifier: "CategoryTV")
        // Do any additional setup after loading the view.
    }
    
    func apiFor_AppConfiguration()  {
        if Reachability.isConnectedToNetwork() {
            self.showLoader()
            API.appConfiguration { (appConfig, msg) in
                guard let config = appConfig else {
                    self.showAlert(withTitle: msg ?? "", withMessage: "")
                    return
                }
                self.hideLoader()
                AppDelegate.appConfig = config
                self.menuObj = AppDelegate.appConfig.collectionList!.shelf!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        else {
            let alert = AlertView(forIndex: 1, Buttons: [.Retry,.Exit], message: INTERNET_ERROR, controller: self)
            alert.delegate = self
            alert.Show()
        }
    }
}

extension CategoryVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuObj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTV", for: indexPath) as! CategoryTV
        cell.headerTableLbl.text = menuObj[indexPath.row].header?.title
        cell.initiateColllection(videoItemResponse: (menuObj[indexPath.row].section!.lockup))
        return cell
    }
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension CategoryVC: AlertViewDelegate {
    func Retry(alertIndex: Int) {
        self.showLoader()
        self.apiFor_AppConfiguration()
    }
    func Exit(alertIndex: Int) {
        exit(0)
    }
}
