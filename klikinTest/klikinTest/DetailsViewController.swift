//
//  DetailsViewController.swift
//  klikinTest
//
//  Created by Jaime on 21/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class DetailsViewController: UIViewController, DetailsViewControllerDelegate {
    
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var photosScrollView: UIScrollView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneLabel: UITextView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var loadingView: UIView!
    
    fileprivate let photoHeight: CGFloat = 200
    fileprivate var presenterDelegate: DetailsPresenterDelegate?
    fileprivate var commerce: Commerce?
    
    // MARK: - Public methods
    
    func setupViewController(presenterDelegate: DetailsPresenterDelegate) {
        
        self.presenterDelegate = presenterDelegate
    }
    
    // MARK: - DetailsViewControllerDelegate methods
    
    func startLoading() {
     
        loadingView.isHidden = false
    }
    
    func stopLoading() {

        loadingView.isHidden = true
    }
    
    func showCommerce(_ commerce: Commerce) {
        
        self.commerce = commerce
        
        updatePhotosScrollImages()
        nameLabel.text = commerce.name.capitalized
        phoneLabel.text = commerce.contact.phone
        phoneLabel.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        addressLabel.text = commerce.formatAddress()
        setupDescriptionLabel()
    
        updateScrollSize()
    }
    
    // MARK: - Private methods
    
    fileprivate func updatePhotosScrollImages() {
        
        removePhotosFromScroll()
        
        if let commerce = commerce, let photosScrollView = photosScrollView {
            
            var originX: CGFloat = 0
            let width = photosScrollView.frame.width
            let height = photosScrollView.frame.height
            
            for onePhoto in commerce.photos {
             
                let imageView = UIImageView.init(frame: CGRect(x: originX, y: 0, width: width, height: height))
                if let url = URL(string: onePhoto) {
                    imageView.sd_setImage(with: url)
                    imageView.contentMode = .scaleAspectFit
                    imageView.backgroundColor = UIColor.black
                    photosScrollView.addSubview(imageView)
                    originX += width
                }
            }
            
            photosScrollView.contentSize = CGSize(width: originX, height: height)
        }
    }
    
    fileprivate func removePhotosFromScroll() {
        
        if let photosScrollView = photosScrollView {
            
            for onePhoto in photosScrollView.subviews {
                onePhoto.removeFromSuperview()
            }
        }
        
        photosScrollView.contentSize = CGSize(width: mainScrollView.frame.width, height: mainScrollView.frame.height)
    }
    
    fileprivate func setupDescriptionLabel() {
        
        let width = descriptionLabel.frame.width
        let font = descriptionLabel.font
        var frame  = descriptionLabel.frame
        frame.size.height = (commerce?.longDescription.height(withConstrainedWidth: width, font: font!))!
        descriptionLabel.frame = frame
        
        descriptionLabel.text = commerce?.longDescription
    }
    
    fileprivate func updateScrollSize() {
        
        let width = mainScrollView.contentSize.width
        let height = descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height
        mainScrollView.contentSize = CGSize(width: width, height: height)
    }
}
