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
open class MandrillEmail: Mappable{
    
    open var to       :[MandrillTo]?
    open var from     :String?
    open var fromName :String?
    open var subject  :String?
    open var html     :String?
    open var text     :String?
    
    public required init?(_ map: Map) {}
    
    public init(){}
    
    /**
     Constructor that receives an array of several to emails
     
     - parameter from:
     - parameter fromName: The name of the person sending the email
     - parameter to:
     - parameter subject:
     - parameter html:
     - parameter text:
     
     - returns:
     */
    public convenience init(from: String, fromName:String, to: [MandrillTo], subject: String, html: String?, text: String?)
    {
        self.init()
        
        self.from = from
        self.fromName = fromName
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
    public convenience init(from: String, fromName:String, to: String, subject: String, html: String?, text: String?)
    {
        self.init()
        
        self.from = from
        self.fromName = fromName
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
    open func mapping(_ map: Map){
        to       <- map["to"]
        from     <- map["from_email"]
        fromName <- map["from_name"]
        subject  <- map["subject"]
        html     <- map["html"]
        text     <- map["text"]
    }
}
