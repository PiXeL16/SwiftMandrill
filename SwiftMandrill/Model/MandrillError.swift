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
public class MandrillError:Mappable {
    
    public var status :String?
    public var code : Int?
    public var name : String?
    public var message :String?
    
    
    public required init?(_ map: Map) {}
    
    public func mapping(map: Map) {
        status     <- map["status"]
        code       <- map["code"]
        name       <- map["name"]
        message    <- map["message"]
    }
}
