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
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    
    // MARK: - Public methods
    
    func setupCell(withCommerce commerce: Commerce) {
        
        let url = URL(string: commerce.logo)
        logoView.sd_setImage(with: url)
        
        nameLabel.text = commerce.name.capitalized
        
        if (commerce.isShortDescriptionEmpty()) {
            stackView.removeArrangedSubview(descriptionLabel)
            descriptionLabel.removeFromSuperview()
        } else {
            descriptionLabel.text = commerce.shortDescription
        }
        
        cityLabel.text = commerce.address.city.capitalized
        categoryLabel.text = commerce.category.uppercased()
    }
}
