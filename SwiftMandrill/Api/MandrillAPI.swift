//
//  MandrillAPI.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/18/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Alamofire
import ObjectMapper

/// Mandrill API access and definition
open class MandrillAPI {
    fileprivate let apiKey : String
    
    //ApiRouter enum that will take care of the routing of the urls and paths of the API
    fileprivate enum ApiRouter: URLConvertible {
        static let baseURL = Constants.baseAPIURL;
        
        case sendMessage
        
        var path: String {
            switch self{
            case .sendMessage:
                return "/messages/send.json";
            }
        }
        
        var URLString : String {
            let url = URL(string: ApiRouter.baseURL)!
            let urlRequest = NSMutableURLRequest(url: url.appendingPathComponent(path))
            return (urlRequest.url?.absoluteString)!
        }
        
        func asURL() throws -> URL {
            return URL(string: ApiRouter.baseURL)!
        }
    }
    
    /**
     Initializer for the class the takes the Mandrill API key
     
     - parameter apiKey: Api key to be use in the request
     
     - returns:
     */
    public init(ApiKey apiKey:String) {
        self.apiKey = apiKey
    }
    
    /**
     Sends an email with the inline parameters
     
     - parameter from:              from email
     - parameter fromName:          name of the person sending the email
     - parameter to:                to email
     - parameter subject:           subject of the email
     - parameter html:              html
     - parameter text:              text
     - parameter completionHandler: the completion handler
     */
    open func sendEmail(from:String, fromName:String, to:String, subject:String, html:String?, text:String?, completionHandler:@escaping (MandrillResult) -> Void) -> Void {
        let email = MandrillEmail(from: from, fromName:fromName, to: to, subject: subject, html: html, text: text)
        return sendEmail(withEmail: email, completionHandler: completionHandler)
    }
    
    /**
     Sends an email to an array of recipients
     
     - parameter from:              from
     - parameter to:                array of recypients
     - parameter subject:           subject
     - parameter html:              html
     - parameter text:              text
     - parameter completionHandler: the completion handler
     */
    open func sendEmail(from:String, fromName:String, to:[String], subject:String, html:String?, text:String?, completionHandler:@escaping (MandrillResult) -> Void) -> Void {
        let emails = to.map({MandrillTo(email: $0)})
        let email = MandrillEmail(from: from, fromName:fromName, to: emails, subject: subject, html: html, text: text)
        return sendEmail(withEmail: email, completionHandler: completionHandler)
    }
    
    
    /**
     Sends an email using the Mandrill email object values and returns the result in the result handler
     
     - parameter email:             Email Object
     - parameter completionHandler: Result completion handler
     */
    open func sendEmail(withEmail email:MandrillEmail, completionHandler:@escaping (MandrillResult) -> Void) -> Void {
        let test = Mapper().to
        
        let params : [String:AnyObject] = [
            "key": self.apiKey as AnyObject,
            "message": Mapper().toJSON(email) as AnyObject
        ]
        
        if let url = URL(string: ApiRouter.sendMessage.URLString) {
            Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
                .validate()
                .responseJSON { response in
                    response.result.isFailure
                    
                    switch response.result {
                    case .failure(let error):
                        print("error calling \(ApiRouter.sendMessage)")
                        print(error)
                        
                        var errorMessage = error.localizedDescription
                        
                        if let data = response.data {
                            if let errorResult: MandrillError = ObjectParser.objectFromJsonString(String(data: data, encoding: String.Encoding.utf8)) {
                                errorMessage = errorResult.message!
                            }
                        }
                        
                        let result = MandrillResult(success: false, message: errorMessage)
                        completionHandler(result)
                        return
                    case .success:
                        if let value: AnyObject = response.result.value as AnyObject? {
                            let emailResults:[MandrillEmailResult] = ObjectParser.objectFromJsonArray(value)!
                            let result = MandrillResult(success: true, emailResults: emailResults)
                            completionHandler(result)
                            return
                        }
                    }
            }
        }
    }
}
