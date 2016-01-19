//
//  MandrillResult.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/18/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import ObjectMapper

public class MandrillResult{
    
    public var emailsResults : [MandrillEmailResult]?
    
    public var success: Bool = false
    public var message: String?
    
    public var hasError : Bool{
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

