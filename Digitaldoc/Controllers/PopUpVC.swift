//
//  PopUpVC.swift
//  Digitaldoc
//
//  Created by Manoj on 10/03/22.
//

import UIKit

class PopUpVC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var no_Btn: UIButton!
    @IBOutlet var yes_Btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yes_Btn.layer.masksToBounds = true
        no_Btn.layer.masksToBounds = true
        containerView.layer.borderWidth = 3.5
        containerView.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        containerView.layer.cornerRadius = 10.0
        
        yes_Btn.layer.borderWidth = 3.5
        yes_Btn.layer.borderColor = UIColor(red: 143/255, green: 141/255, blue: 134/255, alpha: 1.0).cgColor
        yes_Btn.layer.cornerRadius = 10.0
        
        no_Btn.layer.borderWidth = 3.5
        no_Btn.layer.borderColor = UIColor(red: 143/255, green: 141/255, blue: 134/255, alpha: 1.0).cgColor
        no_Btn.layer.cornerRadius = 10.0
    }
    
    @IBAction func onClick_No(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClick_Yes(_ sender: Any) {
        exit(-1)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        if context.nextFocusedView == no_Btn  {
            no_Btn.backgroundColor = UIColor(red: 79/255, green: 132/255, blue: 247/255, alpha: 1.0)
            no_Btn.setTitleColor(.white, for: .normal)
            yes_Btn.setTitleColor(.lightGray, for: .normal)
            yes_Btn.backgroundColor = UIColor.clear
        }else {
            no_Btn.setTitleColor(.lightGray, for: .normal)
            no_Btn.backgroundColor = UIColor.clear
            yes_Btn.backgroundColor = UIColor(red: 79/255, green: 132/255, blue: 247/255, alpha: 1.0)
            yes_Btn.setTitleColor(.white, for: .normal)
        }
    }
    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        if context.nextFocusedView == yes_Btn{
            return true
        }
        return true
    }
}
