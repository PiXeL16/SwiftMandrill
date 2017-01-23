//
//  ObjectParser.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/20/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

open class ObjectParser
{
    
    /**
     Converts and parse and object from a json file for testing
     
     - parameter fileName: file name
     
     - returns: object conforming to Mappable
     */
    open class func objectFromJson<T: Mappable>(_ json: AnyObject?) -> T? {
        return Mapper<T>().map(JSON: json as! [String : Any])
    }
    
    
    /**
     Converts and parse and object from a json string
     
     - parameter json: String
     
     - returns:
     */
    open class func objectFromJsonString<T: Mappable>(_ json: String?) -> T? {
        if let _json = json {
            return Mapper<T>().map(JSONString: _json)
        }
        return nil
    }
    
    /**
     Converts and parse and object to an array
     - parameter fileName: filename
     
     - returns: array of objects
     */
    open class func objectFromJsonArray<T: Mappable>(_ json: AnyObject?) -> [T]? {
        if let _json = json as? [[String : Any]] {
            return Mapper<T>().mapArray(JSONArray: _json)
        }
        return nil
    }

    
    
    
    
}
