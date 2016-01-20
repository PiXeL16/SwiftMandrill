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
        let path = NSBundle(forClass: self).pathForResource(file, ofType: "json")
        
        if path != nil {
            if let data = NSData(contentsOfFile: path!) {
                                
                return try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
            }
        }
        
        return .None
    }
}