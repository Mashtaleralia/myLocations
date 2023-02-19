//
//  String + AddText.swift
//  myLocations
//
//  Created by Admin on 18.02.2023.
//

import Foundation
import UIKit
extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
