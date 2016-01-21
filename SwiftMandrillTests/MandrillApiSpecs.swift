//
//  MandrillApiSpec.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/19/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation
import Nimble
import Quick
import SwiftMandrill
import Keys

/// API Specs hiting the real API. TODO: Add HUB
class MandrillApiSpecs: QuickSpec {
    override func spec() {
        
        let timeout: NSTimeInterval = 10
      
        it("send email without api valid api key"){
            
            let api = MandrillAPI(ApiKey: "")
            
            let email = MandrillEmail(from: "test@test.com", to: "test@gmail.com", subject: "test", html: "test", text: "test")
            
            var result : MandrillResult? = nil
            
            api.sendEmail(withEmail: email){ mandrillResult in
                    result = mandrillResult
            }
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.hasError).toEventually(beTruthy(),timeout:timeout)
            expect(result!.message).toEventuallyNot(beNil(), timeout:timeout)
            
        }
        
        it("send email with valid api key"){
            
            
            let keys = SwiftmandrillKeys()
        
            let api = MandrillAPI(ApiKey: keys.mANDRILL_API())
            
            let email = MandrillEmail(from: "test@test.com", to: "cjimenez16@gmail.com", subject: "this is s test", html: "test", text: "test")
            
            var result : MandrillResult? = nil
            
            api.sendEmail(withEmail: email){ mandrillResult in
                result = mandrillResult
            }
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.hasError).toEventually(beFalsy(),timeout:timeout)
            expect(result!.message).toEventually(beNil(), timeout:timeout)

        }
        
        it("send email with inline parameters"){
            
            let keys = SwiftmandrillKeys()
            
            let api = MandrillAPI(ApiKey: keys.mANDRILL_API())
            
            var result : MandrillResult? = nil
            
            api.sendEmail(from: "test@test.com", to: "cjimenez16@gmail.com", subject: "test", html: "test", text: "test"){ mandrillResult in
                result = mandrillResult
            }

            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.hasError).toEventually(beFalsy(),timeout:timeout)
            expect(result!.message).toEventually(beNil(), timeout:timeout)
            
        }
        
        it("send email with inline parameters to several recipients"){
            
            let keys = SwiftmandrillKeys()
            
            let api = MandrillAPI(ApiKey: keys.mANDRILL_API())
            
            var result : MandrillResult? = nil
            
            api.sendEmail(from: "test@test.com", to: ["cjimenez16@gmail.com","test2@test.com"], subject: "test", html: "test", text: "test"){ mandrillResult in
                result = mandrillResult
            }
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.hasError).toEventually(beFalsy(),timeout:timeout)
            expect(result!.message).toEventually(beNil(), timeout:timeout)
            
        }
        
        it("send email to several recipients with email object"){
            
            let keys = SwiftmandrillKeys()
            
            let api = MandrillAPI(ApiKey: keys.mANDRILL_API())
            
            var result : MandrillResult? = nil
            
            let to1 = MandrillTo(email: "test@test.com")
            let to2 = MandrillTo(email: "test@test2.com")
            
            let email = MandrillEmail(from: "test@test.com", to: [to1,to2], subject: "test", html: "test", text: "test")
            
            api.sendEmail(withEmail: email){ mandrillResult in
                result = mandrillResult
            }
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.hasError).toEventually(beFalsy(),timeout:timeout)
            expect(result!.message).toEventually(beNil(), timeout:timeout)
            
        }

    }
    
}
