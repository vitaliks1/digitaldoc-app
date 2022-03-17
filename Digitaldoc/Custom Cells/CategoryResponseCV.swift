//
//  CategoryResponseCV.swift
//  Digitaldoc
//
//  Created by Manoj on 09/03/22.
//

import UIKit

class CategoryResponseCV: UICollectionViewCell {
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var ImgContentView: UIView!
    
    var motionEffectGroup = UIMotionEffectGroup()
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({
            if context.nextFocusedView == self
            {
                UIView.animate(withDuration: 0.2, animations: { [self] in
                    self.categoryImg.transform = CGAffineTransform(scaleX: 1.20, y: 1.20)
                    self.categoryTitle.transform = CGAffineTransform(scaleX: 1.20, y: 1.20)
                    self.categoryTitle.layer.zPosition = 1
                    self.categoryTitle.textColor = .orange
                    self.transform = CGAffineTransform(scaleX: 1.01, y: 1.01)
                    self.layoutIfNeeded()
                    self.categoryImg.removeMotionEffect(self.motionEffectGroup)
                    let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
                    verticalMotionEffect.minimumRelativeValue = -10
                    verticalMotionEffect.maximumRelativeValue = 10
                    let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
                    horizontalMotionEffect.minimumRelativeValue = -10
                    horizontalMotionEffect.maximumRelativeValue = 10
                    self.motionEffectGroup = UIMotionEffectGroup()
                    self.motionEffectGroup.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
                    self.categoryImg.addMotionEffect(self.motionEffectGroup)
                    self.categoryTitle.addMotionEffect(self.motionEffectGroup)
                })
            }
            else if context.previouslyFocusedView == self
            {
                UIView.animate(withDuration: 0.2, animations: {
                    self.categoryImg.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.categoryTitle.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.categoryTitle.textColor = .white
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.layoutIfNeeded()
                    self.categoryImg.removeMotionEffect(self.motionEffectGroup)
                    self.categoryTitle.removeMotionEffect(self.motionEffectGroup)
                })
            }
        }, completion: nil)
    }
}
