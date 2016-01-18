//
//  MandrillAPI.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/18/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Alamofire

import Himotoki

/// Mandrill API access and definition
public class MandrillAPI {
    
    private let apiKey : String
    

    //ApiRouter enum that will take care of the routing of the urls and paths of the API
    private enum ApiRouter: URLStringConvertible {
        
        static let baseURL = Constants.baseAPIURL;
        
        case sendMessage
        
        var path: String {
            switch self{
            case .sendMessage:
                return "/messages/send.json";
                
            }
        }
        
        var URLString : String{
            
            let url = NSURL(string: ApiRouter.baseURL)!
            let urlRequest = NSMutableURLRequest(URL: url.URLByAppendingPathComponent(path))
            return urlRequest.URLString;
        }
        
    }
    
    /**
     Initializer for the class the takes the Mandrill API key
     
     - parameter apiKey: Api key to be use in the request
     
     - returns:
     */
    public init(ApiKey apiKey:String)
    {
        self.apiKey = apiKey
    }
    
    
    
    public func sendEmail(withEmail email:MandrillEmail)
    {
        
        Alamofire.request(.POST, ApiRouter.sendMessage, parameters: nil, encoding: .JSON)
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling \(ApiRouter.sendMessage)")
                    print(response.result.error!)
                    return
                }
                
                //TODO: Add parsing
                if let value: AnyObject = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
//                    let post = JSON(value)
//                    print("The post is: " + post.description)
                }
        }
    }
    
}
