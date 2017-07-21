//
//  DetailsPresenter.swift
//  klikinTest
//
//  Created by Jaime on 21/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import UIKit

class DetailsPresenter: DetailsPresenterDelegate {
    
    fileprivate var controllerDelegate: DetailsViewControllerDelegate?
    fileprivate var dataSource: DataSourceDelegate?
    fileprivate var router: RouterDelegate?
    
    // MARK: - Public methods
    
    func setupPresenter(controllerDelegate: DetailsViewControllerDelegate,
                        dataSource: DataSourceDelegate,
                        router: RouterDelegate) {
        
        self.controllerDelegate = controllerDelegate
        self.dataSource = dataSource
        self.router = router
    }
    
    func viewController() -> UIViewController? {
        
        return controllerDelegate as? UIViewController
    }
    
    func showCommerce(commerceId: String) {
        
        controllerDelegate?.startLoading()
        
        dataSource?.getCommerce(withId: commerceId, completion: { (commerce, error) in
            
            self.controllerDelegate?.stopLoading()
            if (error == nil) {
                self.controllerDelegate?.showCommerce(commerce)
            } else {
                // TODO: handle error
            }
        })
    }
}
