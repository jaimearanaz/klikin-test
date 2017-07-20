//
//  HomeViewController.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewControllerDelegate {
 
    fileprivate var presenterDelegate: HomePresenterDelegate?
    
    // MARK: - Public methods
    
    func setupViewController(presenterDelegate: HomePresenterDelegate) {
        
        self.presenterDelegate = presenterDelegate
    }
}
