//
//  UIImage + Resize.swift
//  myLocations
//
//  Created by Admin on 17.02.2023.
//

import Foundation
import UIKit
extension UIImage {
    func resize(withBounds bounds: CGSize) -> UIImage {
        let widthRatio = bounds.width/size.width
        let heightRatio = bounds.height/size.height
        let ratio = max(widthRatio, heightRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
