//
//  ExtnUIImage.swift
//  Digitaldoc
//
//  Created by Manoj on 11/03/22.
//

import Foundation
import UIKit

extension UIImage{
    
    func resizeImageWith(newSize: CGSize) -> UIImage {
        
        if(self.size.height < newSize.height || self.size.width < newSize.width)
        {
            return self
        }
        else
        {
            let horizontalRatio = newSize.width / size.width
            let verticalRatio = newSize.height / size.height
            
            let ratio = max(horizontalRatio, verticalRatio)
            let newSiz = CGSize(width: Double(size.width * ratio), height: Double(size.height * ratio))
            print(newSiz)
            
            UIGraphicsBeginImageContextWithOptions(newSiz, true, 0)
            draw(in: CGRect(x: 0, y: 0,
                            width: Double(newSize.width), height: Double(newSize.height)))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            if((newImage?.size.height)! > (newSize.height)) ||  ((newImage?.size.width)! > (newSize.width))
            {
                return (newImage?.cropImage(toRect: CGRect(x: 0, y: 0, width: Double(newSize.width), height: Double(newSize.height))))!
            }else
            {
                return newImage!
            }
        }
        
    }
    
    func cropImagefromTop(top: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: top, width: self.size.width, height: self.size.height-top)
        return cropImage(toRect: rect)
    }
    
    func cropImageHeight(height: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: height)
        return cropImage(toRect: rect)
    }
    
    func cropImage(toRect rect:CGRect) -> UIImage{
        let imageRef:CGImage = self.cgImage!.cropping(to: rect)!
        let croppedImage:UIImage = UIImage(cgImage:imageRef)
        return croppedImage
    }
    
}

