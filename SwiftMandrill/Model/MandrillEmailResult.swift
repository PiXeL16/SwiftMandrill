//
//  MandrillEmailResult.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

/// Class for each email result on the send email request
open class MandrillEmailResult: Mappable {
    
    open var email: String?
    open var status: String?
    open var id: String?
    open var rejectReason: String?
    
    public required init?(map: Map) {}
    
    open func mapping(map: Map) {
        email        <- map["email"]
        status       <- map["status"]
        rejectReason <- map["reject_reason"]
        id           <- map["_id"]
    }
    
}
