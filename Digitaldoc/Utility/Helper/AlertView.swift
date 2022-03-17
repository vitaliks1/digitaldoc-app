//
//  AlertView.swift
//  Digitaldoc
//
//  Created by Manoj on 11/03/22.
//

import UIKit

@objc protocol AlertViewDelegate {
    @objc optional func Retry(alertIndex: Int)
    @objc optional func Exit(alertIndex: Int)
}

class AlertView {
    
    var delegate: AlertViewDelegate?
    private var alertIndex: Int = -1
    var alert: UIAlertController?
    var controller: UIViewController?
    
    init(forIndex: Int,Buttons: [AlertButton],message: String,controller: UIViewController,leftAlign: Bool = false) {
        self.alertIndex = forIndex
        self.controller = controller
        self.alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        
        if leftAlign {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            let messageText = NSMutableAttributedString(
                string: message,
                attributes: [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 23, weight: .regular),//.preferredFont(forTextStyle: UIFontTextStyle.body),
                    NSAttributedString.Key.foregroundColor : UIColor.white
                ]
            )
            self.alert?.setValue(messageText, forKey: "attributedMessage")
        }
        
        for button in Buttons {
            alert?.addAction(getAlertButton(type: button))
        }
    }
    
    func getAlertButton(type: AlertButton) -> UIAlertAction{
        let button: UIAlertAction
        switch type {
        case .Retry:
            button = UIAlertAction(title: RETRY_BTN, style: UIAlertAction.Style.default) { (action) -> Void in
                DispatchQueue.main.async {
                    self.delegate?.Retry!(alertIndex: self.alertIndex)
                }
                return
            }
            break
        case .Exit:
            button = UIAlertAction(title: EXIT_BTN, style: UIAlertAction.Style.default) { (action) -> Void in
                DispatchQueue.main.async {
                    self.delegate?.Exit!(alertIndex: self.alertIndex)
                }
                return
            }
            break
        }
        return button
    }
    
    func Show(animate: Bool = true){
        DispatchQueue.main.async {
            self.controller?.present(self.alert!, animated: animate, completion: nil)
            if !animate {
                let when = DispatchTime.now() + 0.25
                DispatchQueue.main.asyncAfter(deadline: when) {
                    _ = self.alert?.preferredFocusedView
                    self.alert?.setNeedsFocusUpdate()
                    self.alert?.updateFocusIfNeeded()
                }
            }
        }
    }
}

