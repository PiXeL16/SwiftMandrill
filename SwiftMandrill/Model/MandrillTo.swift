//
//  MandrillTo.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

/// Represent a to object in the email
public class MandrillTo: Mappable{
    
    public enum ToType : String {
        case To = "to"
        case CC = "cc"
        case BCC = "bcc"
    }
    
    public var email: String?
    public var name: String?
    public var toType: ToType?
    
    public required init?(_ map: Map) {}
    
    public init(email: String)
    {
        self.email = email
        self.name = ""
        self.toType = .To
    }
    
    public func mapping(map: Map) {
        email  <- map["email"]
        name   <- map["name"]
        toType <- map["type"]
    }
    
}

