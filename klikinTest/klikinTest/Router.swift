//
//  Router.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import UIKit
import UINavigationControllerWithCompletionBlock

class Router: RouterDelegate {
    
    lazy var navigationController: UINavigationController? = {
        
        var navigationController: UINavigationController?
        
        if let rootViewController = self.presenterInstances?.homePresenter.viewController() {
            navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController?.isNavigationBarHidden = false
        }
        
        return navigationController
    }()
    
    fileprivate var presenterInstances: PresenterInstances?
    
    // MARK: - Public methods
    
    func setupRouter(presenterInstances: PresenterInstances) {
        
        self.presenterInstances = presenterInstances
    }
    
    // MARK: - RouterDelegate methods
    
    func presentHome() {
        
        self.presenterInstances?.homePresenter.showCommerces()
    }
    
    func presentCommerce(commerceId: String) {
        
        
        if let detailsPresenter = presenterInstances?.detailsPresenter,
            let viewController = detailsPresenter.viewController() {
            
            navigationController?.pushViewController(viewController, animated: true, withCompletionBlock: {
                detailsPresenter.showCommerce(commerceId: commerceId)
            })
        }
    }
}
