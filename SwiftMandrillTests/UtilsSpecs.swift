//
//  UtilsSpecs.swift
//  SwiftMandrill
//
//  Created by Chris Jimenez on 1/20/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import Nimble
import Quick
import SwiftMandrill

class UtilsSpecs: QuickSpec{
    override func spec() {
        
        it("Read invalid json file"){
            
            let jsonContent = JSONFileReader.JSON(fromFile: "none")
            
            expect(jsonContent).to(beNil())
        }
    }
    
}
