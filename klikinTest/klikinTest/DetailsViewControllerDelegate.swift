//
//  DetailsViewControllerDelegate.swift
//  klikinTest
//
//  Created by Jaime on 21/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation

protocol DetailsViewControllerDelegate {
 
    func startLoading()
    
    func stopLoading()
    
    func showCommerce(_ commerce: Commerce)
}
