//
//  String+Height.swift
//  klikinTest
//
// https://stackoverflow.com/questions/30450434/figure-out-size-of-uilabel-based-on-string-in-swift
//

import Foundation
import UIKit

extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}
