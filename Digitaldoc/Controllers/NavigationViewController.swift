//
//  NavigationViewController.swift
//  Digitaldoc
//
//  Created by Manoj on 09/03/22.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(tvOS 13.0, *) {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        }else {
            // Todo.
        }
    }
}
