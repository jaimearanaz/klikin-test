//
//  AppDelegate.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let presenterInstances = PresenterInstances()
        let router = Router()
        let dataSource = DataSource()
        
        presenterInstances.setupPresenterInstances(router: router, dataSource: dataSource)
        router.setupRouter(presenterInstances: presenterInstances)
        
        let windowFrame = UIScreen.main.bounds
        window = UIWindow(frame: windowFrame)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = router.navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

