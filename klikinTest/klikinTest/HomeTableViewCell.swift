//
//  HomeTableViewCell.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet var logoView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    
    // MARK: - Public methods
    
    func setupCell(withCommerce commerce: Commerce) {
        
        let url = URL(string: commerce.logo)
        logoView.sd_setImage(with: url)
        
        nameLabel.text = commerce.name.capitalized
        descriptionLabel.text = commerce.shortDescription
        cityLabel.text = commerce.address.city
        categoryLabel.text = commerce.category.uppercased()
    }
}
