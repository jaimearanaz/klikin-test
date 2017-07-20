//
//  WebServices.swift
//  klikinTest
//
//  Created by Jaime on 20/07/2017.
//  Copyright © 2017 Jaime. All rights reserved.
//

import Foundation
import JSONModel

class WebServices {
    
    fileprivate let baseUrl = "https://s3-eu-west-1.amazonaws.com/developers-tests/"
    fileprivate let serviceCommerces = "commerces.json"
    
    // MARK: - WebServicesDelegate methods
    
    func getCommerces(completion: @escaping ((_ commerces: [Commerce], _ error: NSError?) -> Void)) {
        
        let requestUrl = "\(baseUrl)\(serviceCommerces)"
        let request = NSMutableURLRequest(url: URL(string: requestUrl)!)
        
        launchAndParseCollectionRequest(request) { (products: [Commerce], error: NSError?) in
            
            completion(products, error)
        }
    }
    
    // MARK: - Private methods
    
    fileprivate func launchAndParseCollectionRequest <T: JSONModel> (
        _ request: NSMutableURLRequest,
        completion: ((_ collection: [T], _ error: NSError?) -> Void)? ) {

        let session = URLSession.shared;
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, errorRequest -> Void in
            
            var collection = [T]()
            var anyError: NSError?
            
            let httpResponse = response as? HTTPURLResponse
            let successStatus = (httpResponse != nil) && ((httpResponse?.statusCode)! >= 200) && ((httpResponse?.statusCode)! <= 299)
            let isValidResponse = (data != nil) && (errorRequest == nil) && successStatus
            
            if isValidResponse {
                
                collection = self.parseCollection(data: data!, parsingError: &anyError)
                
            } else {
                
                let statusCode = (httpResponse != nil) ? httpResponse?.statusCode : 0
                let message = "exception requesting " + T.description() + ", status code " + String(describing: statusCode)
                anyError = NSError.init(domain: message, code: 0, userInfo: nil)
            }
            
            DispatchQueue.main.async(execute: {
                
                if let completion = completion {
                    completion(collection, anyError)
                }
            })
        })
        
        task.resume()
    }
    
    fileprivate func parseCollection <T: JSONModel> (
        data: Data,
        parsingError: inout NSError?) -> [T] {
        
        var collection = [T]()
        
        do {
            
            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSArray
//            if let jsonDictionary = jsonDictionary, let results = jsonDictionary.object(forKey: wrappedField) {
//                collection = try NSArray(array: T.arrayOfModels(fromDictionaries: results as! [AnyObject], error: ())) as! [T]
//            }
            
            collection = try NSArray(array: T.arrayOfModels(fromDictionaries: jsonDictionary! as [AnyObject], error: ())) as! [T]
            if (jsonDictionary == nil) {
                parsingError = NSError.init(domain: "exception parsing " + T.description(), code: 0, userInfo: nil)
            }
            
        } catch {
            
            parsingError = NSError.init(domain: "exception parsing " + T.description(), code: 0, userInfo: nil)
        }
        
        return collection
    }
}
