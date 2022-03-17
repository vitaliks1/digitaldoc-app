//
//  RootVC.swift
//  Digitaldoc
//
//  Created by Manoj on 09/03/22.
//

import UIKit

class RootVC: UIViewController {
    
    var tabBarViewController: TabBarViewController!
    var actInd:UIActivityIndicatorView!
    var startingIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTabBarController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        apiFor_AppConfiguration()
    }
    
    func apiFor_AppConfiguration()  {
        if Reachability.isConnectedToNetwork() {
            self.showLoader()
            API.appConfiguration { (appConfig, msg) in
                guard let config = appConfig else {
                    self.showAlert(withTitle: msg ?? "", withMessage: "")
                    return
                }
                AppDelegate.appConfig = config
                self.presentTabBarController()
            }
        }
        else {
            let alert = AlertView(forIndex: 1, Buttons: [.Retry,.Exit], message: INTERNET_ERROR, controller: self)
            alert.delegate = self
            alert.Show()
        }
    }
    
    func presentTabBarController() {
        DispatchQueue.main.async {
            self.tabBarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarViewController") as? TabBarViewController
            var viewControllers = [NavigationViewController]()
            var i = 0
            for n in 0...1 {
                switch n{
                case 1:
                    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryVC") as! CategoryVC
                    controller.title = "Home"
                    let tabBarItem = UITabBarItem(title:"Home", image: nil, selectedImage: nil)
                    controller.tabBarItem = tabBarItem
                    let navController = NavigationViewController(rootViewController: controller)
                    viewControllers.append(navController)
                    break
                default:
                    print("no button item created")
                }
                i+=1
            }
            if viewControllers.count > 0 {
                self.tabBarViewController.setViewControllers(viewControllers, animated: false)
                self.tabBarViewController.selectedViewController = viewControllers[self.startingIndex]
                let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                appDelegate.window?.rootViewController = self.tabBarViewController
                appDelegate.window?.makeKeyAndVisible()
            }
            else {
                let alert = AlertView(forIndex: 1, Buttons: [.Retry,.Exit], message: EMPTY_DATA_SOURCE, controller: self)
                alert.delegate = self
                alert.Show()
            }
            self.hideLoader()
        }
    }
}

extension RootVC: AlertViewDelegate {
    func Retry(alertIndex: Int) {
        self.showLoader()
        self.apiFor_AppConfiguration()
    }
    
    func Exit(alertIndex: Int) {
        exit(0)
    }
}
