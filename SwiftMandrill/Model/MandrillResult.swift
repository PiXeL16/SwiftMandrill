//
//  MandrillResult.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/18/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

/// Class with the results of the MailAPI
open class MandrillResult{
    
    /// Results for all the mail sendis
    open var emailsResults : [MandrillEmailResult]?
    
    open var success: Bool = false
    open var message: String?
    
    open var hasError : Bool{
        return !success
    }
    
    public init(success:Bool, message:String){
        self.success = success
        self.message = message
    }
    
    public init(success:Bool, emailResults:[MandrillEmailResult])
    {
        self.success = success
        self.emailsResults = emailResults
    }
}

