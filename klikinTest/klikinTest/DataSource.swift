//
//  DataSource.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation

class DataSource: DataSourceDelegate {
    
    fileprivate var webServices = WebServices()
    fileprivate var commerces = [Commerce]()
    
    // MARK: - DataSourceDelegate methods
    
    func getCommerces(completion: @escaping ((_ commerces: [Commerce], _ error: NSError?) -> Void)) {
        
        webServices.getCommerces { (commerces, error) in
            
            self.commerces = commerces
            completion(commerces, error)
        }
    }
    
    func getCommerce(withId id: String, completion: @escaping ((_ commerce: Commerce, _ error: NSError?) -> Void)) {
        
        var commerce = Commerce()
        
        let cached = (commerces.count > 0)
        if (cached) {
            
            if let found = commerces.first(where: {
                $0.identifier == id
            }) {
                commerce = found
                completion(commerce, nil)
            } else {
                completion(commerce, NSError(domain: "not found", code: 0, userInfo: nil))
            }
            
        } else {
            completion(commerce, NSError(domain: "not found", code: 0, userInfo: nil))
        }
    }
}
