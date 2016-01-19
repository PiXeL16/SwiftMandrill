//
//  MandrillEmailResult.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

public class MandrillEmailResult: Mappable {
    
    public var email: String?
    public var status: String?
    public var id: String?
    public var rejectReason: String?
    
    public required init?(_ map: Map) {}
    
    public init(){}
    
    public func mapping(map: Map) {
        email        <- map["email"]
        status       <- map["status"]
        rejectReason <- map["reject_reason"]
        id           <- map["_id"]
    }
    
}
