//
//  HomePresenter.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter: HomePresenterDelegate {
    
    fileprivate var controllerDelegate: HomeViewControllerDelegate?
    fileprivate var dataSource: DataSourceDelegate?
    fileprivate var router: RouterDelegate?
    
    // MARK: - Public methods
    
    func setupPresenter(controllerDelegate: HomeViewControllerDelegate,
                        dataSource: DataSourceDelegate,
                        router: RouterDelegate) {
        
        self.controllerDelegate = controllerDelegate
        self.dataSource = dataSource
        self.router = router
    }
    
    func viewController() -> UIViewController? {
        
        return controllerDelegate as? UIViewController
    }
    
    func showCommerces() {
        
        controllerDelegate?.startLoading()
        
        dataSource?.getCommerces(completion: { (commerces, error) in
            
            self.controllerDelegate?.stopLoading()
            
            if (error == nil) {
                self.controllerDelegate?.showCommerces(commerces)
            } else {
                // TODO: handle error
            }
        })
    }
    
    // MARK: - HomePresenterDelegate methods
    
    func didSelectCommerce(commerceId: String) {
        
        router?.presentCommerce(commerceId: commerceId)
    }
}
