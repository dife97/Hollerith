//
//  UIFont+Extension.swift
//  Hollerith
//
//  Created by Diego Ferreira on 10/11/22.
//

import UIKit

extension UIFont {
    
    enum RobotoFont: String {
        case regular = "Roboto-Regular"
        case bold = "Roboto-Bold"
    }
    
    static func setRobotoFont(weight: RobotoFont, size: CGFloat) -> UIFont {
        
        return UIFont(name: weight.rawValue, size: size)!
    }
}
