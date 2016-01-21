//
//  TestDataModelSpecs.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import Nimble
import Quick
import SwiftMandrill
import ObjectMapper
import Keys

/// Model specs using fake data.
class TestDataModelSpecs: QuickSpec{
    override func spec() {
        
        let email = "recipient.email@example.com"
        
        it("Decode email result"){
            
            let emailResult: MandrillEmailResult? = ObjectParser.objectFromJson(JSONFileReader.JSON(fromFile: "email_result"))
            
            expect(emailResult).toNot(beNil())
            expect(emailResult!.email).toNot(beNil())
            expect(emailResult!.email).to(equal(email))
            
        }
        
        it("Decode email array result"){
            
            let emailResult: [MandrillEmailResult]? = ObjectParser.objectFromJsonArray(JSONFileReader.JSON(fromFile: "email_result_array"))
            
            expect(emailResult).toNot(beNil())
            expect(emailResult!.count).to(equal(1))
                
        }
        
        it("Decode to object"){
            
            let emailTo: MandrillTo? = ObjectParser.objectFromJson(JSONFileReader.JSON(fromFile: "email_to"))
            
            expect(emailTo).toNot(beNil())
            expect(emailTo!.email).toNot(beNil())
            expect(emailTo!.email).to(equal(email))
            expect(emailTo!.name).toNot(beNil())
     
            expect(emailTo!.toType).to(equal(MandrillTo.ToType.To))
        
        }
        
        it("Decode email"){
            
            let emailObject: MandrillEmail? = ObjectParser.objectFromJson(JSONFileReader.JSON(fromFile: "email"))
            
            expect(emailObject).toNot(beNil())
            expect(emailObject!.from).toNot(beNil())
            expect(emailObject!.to!.count).to(equal(1))
            
        }
        
        it("Decode error result"){
            
            let error: MandrillError? = ObjectParser.objectFromJson(JSONFileReader.JSON(fromFile: "error"))
            
            expect(error).toNot(beNil())
            expect(error!.message).toNot(beNil())
            expect(error!.code).toNot(beNil())
            expect(error!.name).toNot(beNil())
            expect(error!.status).toNot(beNil())
            
        }
        
        it("Decode error result"){
            
            let error: MandrillError? = ObjectParser.objectFromJson(JSONFileReader.JSON(fromFile: "error"))
            
            expect(error).toNot(beNil())
            expect(error!.message).toNot(beNil())
            expect(error!.code).toNot(beNil())
            expect(error!.name).toNot(beNil())
            expect(error!.status).toNot(beNil())
            
        }
        
    }
}
