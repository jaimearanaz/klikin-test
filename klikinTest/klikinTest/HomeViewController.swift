//
//  HomeViewController.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet var tableView: UITableView!
    
    fileprivate let rowHeight: CGFloat = 100
    fileprivate var presenterDelegate: HomePresenterDelegate?
    fileprivate var commerces = [Commerce]()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let identifier = String(describing: HomeTableViewCell.self)
        let nib = UINib.init(nibName: identifier, bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: identifier)
    }
    
    // MARK: - Public methods
    
    func setupViewController(presenterDelegate: HomePresenterDelegate) {
        
        self.presenterDelegate = presenterDelegate
    }
    
    // MARK: - HomeViewControllerDelegate methods
    
    func startLoading() {
        
        // TODO: show loading view
    }
    
    func stopLoading() {
        
        // TODO: hide loading view
    }
    
    func showCommerces(_ commerces: [Commerce]) {
        
        self.commerces = commerces
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commerces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = String(describing: HomeTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! HomeTableViewCell
        let commerce = commerces[indexPath.row]
        cell.setupCell(withCommerce: commerce)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO:
    }
}
