//
//  MyTabBarController.swift
//  myLocations
//
//  Created by Admin on 19.02.2023.
//

import Foundation
import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
