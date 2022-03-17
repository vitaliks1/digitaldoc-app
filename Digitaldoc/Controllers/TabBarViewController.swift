//
//  TabBarViewController.swift
//  Digitaldoc
//
//  Created by Manoj on 09/03/22.
//

import UIKit

class TabBarViewController: UITabBarController,UINavigationControllerDelegate,UITabBarControllerDelegate {
    
    var window:UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)];
        self.view.addGestureRecognizer(tapRecognizer)
        tabBarController?.navigationController?.navigationBar.isHidden = true
        tabBar.frame.origin.x = 20
        self.view.backgroundColor = .clear
        self.tabBar.unselectedItemTintColor = .white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:UIControl.State.focused)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:UIControl.State.normal)
        self.tabBar.items?[0].selectedImage = UIImage(named: "home-icon")?.withRenderingMode(.alwaysOriginal)
        UITabBar.appearance().unselectedItemTintColor = .white
        self.tabBar.standardAppearance.selectionIndicatorTintColor = tabTheamColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let menuPressRecognizer = UITapGestureRecognizer()
        menuPressRecognizer.addTarget(self, action: #selector(TabBarViewController.menuButtonAction(recognizer:)))
        menuPressRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        self.view.addGestureRecognizer(menuPressRecognizer)
    }
    
    @objc func menuButtonAction(recognizer:UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func tapped() {
        exit(EXIT_SUCCESS)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //To make selected taBbar item bg red view color border.
        if #available(tvOS 13.0, *) {
            let allSubviews = tabBar.subviews(ofType: UIView.self)
            let red_Subviews = allSubviews.filter { $0.backgroundColor == kAppTheamColor  }
            for selected_view in red_Subviews {
                selected_view.layer.borderWidth = 2.0
                selected_view.layer.borderColor = UIColor.black.cgColor
            }
        }
    }
}

extension UIView {
    func subviews<T:UIView>(ofType type: T.Type) -> [T] {
        var result = self.subviews.compactMap { $0 as? T }
        for sub in self.subviews {
            result.append(contentsOf: sub.subviews(ofType: type))
        }
        return result
    }
}

extension UISearchBar {
    var textColor:UIColor? {
        get {
            if let textField = self.value(forKey: "searchField") as? UITextField  {
                return textField.textColor
            } else {
                return nil
            }
        }
        set (newValue) {
            if let textField = self.value(forKey: "searchField") as? UITextField  {
                textField.textColor = newValue
            }
        }
    }
}

