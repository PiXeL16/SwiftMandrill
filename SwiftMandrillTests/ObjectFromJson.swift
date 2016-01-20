//
//  ObjectFromJson.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

/// Converts and parse and object from a json file for testing
public class ObjectFromJson {
    
    /**
     Converts and parse and object from a json file for testing
     
     - parameter fileName: file name
     
     - returns: object conforming to Mappable
     */
    public class func objectFromFile<T: Mappable>(fileName: String) -> T? {
        
        let json = JSONFileReader.JSON(fromFile:fileName)
        
        return Mapper<T>().map(json)
    }
    
    
    /**
     Converts and parse and object to an array
     - parameter fileName: filename
     
     - returns: array of objects
     */
    public class func objectFromFile<T: Mappable>(fileName: String) -> [T]? {
        
        let json = JSONFileReader.JSON(fromFile:fileName)
        
        return Mapper<T>().mapArray(json)
    }


}
