//
//  DataSourceDelegate.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation

protocol DataSourceDelegate {
    
    func getCommerces(completion: @escaping ((_ commerces: [Commerce], _ error: NSError?) -> Void))
    
    func getCommerce(withId id: String, completion: @escaping ((_ commerce: Commerce, _ error: NSError?) -> Void))
}
