//
//  PresenterInstances.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation

class PresenterInstances {
 
    fileprivate var router: RouterDelegate?
    fileprivate var dataSource: DataSourceDelegate?
    
    lazy var homePresenter: HomePresenter = {
        
        let presenter = HomePresenter()
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        presenter.setupPresenter(controllerDelegate: viewController,
                                 dataSource: self.dataSource!,
                                 router: self.router!)
        viewController.setupViewController(presenterDelegate: presenter)
        
        return presenter
    }()
    
    lazy var detailsPresenter: DetailsPresenter = {
        
        let presenter = DetailsPresenter()
        let viewController = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        
        presenter.setupPresenter(controllerDelegate: viewController,
                                 dataSource: self.dataSource!,
                                 router: self.router!)
        viewController.setupViewController(presenterDelegate: presenter)
        
        return presenter
    }()
    
    // MARK: - Public methods
    
    func setupPresenterInstances(router: RouterDelegate, dataSource: DataSourceDelegate) {
        
        self.router = router
        self.dataSource = dataSource
    }
}
