//
//  JSONFileReader.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation

/// Reads a file from path and retunrs the object representation
class JSONFileReader {
    /**
     Reads a json from a file
     
     - parameter file: local file
     
     - returns: Object dic
     */
    class func JSON(fromFile file: String) -> AnyObject? {
        let path = Bundle(for: self).path(forResource: file, ofType: "json")
        
        if path != nil {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
                                
                return try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as AnyObject?
            }
        }
        
        return .none
    }
}
