//
//  HomeViewControllerDelegate.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation

protocol HomeViewControllerDelegate {
    
    func startLoading()
    
    func stopLoading()
    
    func showCommerces(_ commerces: [Commerce])
}
