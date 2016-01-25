//
//  MandrillEmail.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/18/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

//Email object to be send with the API
public class MandrillEmail: Mappable{
    
    public var to      :[MandrillTo]?
    public var from    :String?
    public var subject :String?
    public var html    :String?
    public var text    :String?
    
    public required init?(_ map: Map) {}
    
    public init(){}
    
    /**
     Constructor that receives an array of several to emails
     
     - parameter from:
     - parameter to:
     - parameter subject:
     - parameter html:
     - parameter text:
     
     - returns:
     */
    public convenience init(from: String, to: [MandrillTo], subject: String, html: String?, text: String?)
    {
        self.init()
        
        self.from = from
        self.subject = subject
        self.html = html
        self.text = text
        self.to = to
        
    }
    
    
    /**
     Constructor to be used when sending to a single sender
     
     - parameter from:
     - parameter to:
     - parameter subject:
     - parameter html:
     - parameter text:
     
     - returns: <#return value description#>
     */
    public convenience init(from: String, to: String, subject: String, html: String?, text: String?)
    {
        self.init()
        
        self.from = from
        self.subject = subject
        self.html = html
        self.text = text
        
        let mandrillTo = MandrillTo(email: to)
        
        self.to = [mandrillTo]
        
    }
    
    /**
     Mapping functionality for serialization/deserialization
     
     - parameter map: <#map description#>
     */
    public func mapping(map: Map){
        to      <- map["to"]
        from    <- map["from_email"]
        subject <- map["subject"]
        html    <- map["html"]
        text    <- map["text"]
    }
}
