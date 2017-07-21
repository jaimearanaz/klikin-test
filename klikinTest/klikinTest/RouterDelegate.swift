//
//  RouterDelegate.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation

protocol RouterDelegate {
    
    func presentHome()
    
    func presentCommerce(commerceId: String)
}
