//
//  Address.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import JSONModel

class Address: JSONModel {
    
    var city = ""
    var zip = 0
    var street = ""
    var country = ""
    
    override class func propertyIsOptional(_ propertyName: String!) -> Bool {
        return true
    }
}
