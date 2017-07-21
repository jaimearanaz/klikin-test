//
//  DetailsViewController.swift
//  klikinTest
//
//  Created by Jaime on 21/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController, DetailsViewControllerDelegate {
    
    fileprivate var presenterDelegate: DetailsPresenterDelegate?
    
    // MARK: - Public methods
    
    func setupViewController(presenterDelegate: DetailsPresenterDelegate) {
        
        self.presenterDelegate = presenterDelegate
    }
}
