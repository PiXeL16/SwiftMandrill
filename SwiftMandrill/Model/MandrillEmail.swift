//
//  MandrillEmail.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/18/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import UIKit

//Email object to be send with the API
public struct MandrillEmail {
    
    public let to      :String
    public let from    :String
    public let subject :String
    public let html    :String
    public let text    :String
    
}
