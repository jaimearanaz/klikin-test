//
//  Commerce.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import JSONModel

class Commerce: JSONModel {
    
    var identifier = ""
    var name = ""
    var category = ""
    var shortDescription = ""
    var longDescription = ""
    var logo = ""
    var images = [String]()
    var address = Address()
    var contact = Contact()
    var location = Location()
}
