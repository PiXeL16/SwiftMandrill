//
//  MandrillTo.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

public class MandrillTo: Mappable{
    
    public enum ToType : CustomStringConvertible {
        case To;
        case CC;
        case BCC;
        
        public var description : String {
            switch self {
                // Use Internationalization, as appropriate.
            case .To: return "to";
            case .CC: return "cc";
            case .BCC: return "bcc";
            }
        }
    }
    
    public var email: String?
    public var name: String?
    public var toType: ToType?
    
    public required init?(_ map: Map) {}
    
    public init(){}
    
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

