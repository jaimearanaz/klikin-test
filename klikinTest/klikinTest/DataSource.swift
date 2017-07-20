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
    
    // MARK: - DataSourceDelegate methods
    
    func getCommerces(completion: @escaping ((_ commerces: [Commerce], _ error: NSError?) -> Void)) {
        
        webServices.getCommerces { (commerces, error) in
            
            completion(commerces, error)
        }
    }
}
