//
//  MandrillErrorResult.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

public class MandrillErrorResult:Mappable {
    
    var status :String?
    var code : Int?
    var name : String?
    var message :String?
    
    
    public required init?(_ map: Map) {}
    
    public init(){}
    
    public func mapping(map: Map) {
        status     <- map["status"]
        code       <- map["code"]
        name       <- map["name"]
        message    <- map["message"]
    }
}
