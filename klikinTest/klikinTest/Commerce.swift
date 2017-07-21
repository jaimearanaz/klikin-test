//
//  Commerce.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import JSONModel

class Commerce: JSONModel {
    
    var identifier = ""
    var name = ""
    var category = ""
    var shortDescription = ""
    var longDescription = ""
    var logo = ""
    var photos = [String]()
    var address = Address()
    var contact = Contact()
    var location = [Double]()
    
    // MARK: - Lifecycle methods
    
    override class func keyMapper() -> JSONKeyMapper {
        
        return JSONKeyMapper.init(modelToJSONDictionary: ["identifier": "_id", "longDescription": "description"])
    }
    
    override class func propertyIsOptional(_ propertyName: String!) -> Bool {
        return true
    }
    
    func setLogo(withNSDictionary dictionary: NSDictionary) {
        
        if let thumbnails = dictionary["thumbnails"] as? NSDictionary, let small = thumbnails["small"] as? String {
            logo = small
        }
    }
    
    func setPhotos(withNSArray array: NSArray) {
        
        for onePhoto in array {
            if let photo = onePhoto as? NSDictionary,
                let thumbnails = photo["thumbnails"] as? NSDictionary,
                let medium = thumbnails["medium"] as? String {
                
                photos.append(medium)
            }
        }
    }
    
    // MARK: - Public methods
    
    func isShortDescriptionEmpty() -> Bool {
        
        return (shortDescription == "") || (shortDescription == ".")
    }
}
