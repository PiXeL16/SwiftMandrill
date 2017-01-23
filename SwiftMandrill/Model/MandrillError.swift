//
//  MandrillErrorResult.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

/// Error object when the email fails
open class MandrillError:Mappable {
    
    open var status :String?
    open var code : Int?
    open var name : String?
    open var message :String?
    
    
    public required init?(map: Map) {}
    
    open func mapping(map: Map) {
        status     <- map["status"]
        code       <- map["code"]
        name       <- map["name"]
        message    <- map["message"]
    }
}
