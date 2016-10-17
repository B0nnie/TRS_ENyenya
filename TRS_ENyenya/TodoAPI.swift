//
//  TodoAPI.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/15/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import Foundation

struct TodoAPI {
    
    static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    //MARK: - Fetch JSON
    static func taskForGETMethod(_ completionHandlerForGETMethod: @escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        
        guard let url = URL(string: TodoAPI.Constants.BaseURL) else {
            print("Error: cannot create URL")
            return
        }
        
       let request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard (error == nil) else {
                print("There was an error with your request: \(error?.localizedDescription)")
                completionHandlerForGETMethod(nil, error as NSError?)
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode , statusCode >= 200 && statusCode <= 299 else {
                print("Your request returned a status code other than the 200s")
                return
            }
            
            guard let jsonData = data else {
                print("No data was returned by the request")
                return
            }
            
            convertJSONDataIntoFoundationObjects(jsonData, completionHandlerForFoundationObjects: completionHandlerForGETMethod)
        }.resume()
    }
    
    //MARK: - Serialize JSON
    fileprivate static func convertJSONDataIntoFoundationObjects(_ data: Data, completionHandlerForFoundationObjects: (_ result: AnyObject?, _ error: NSError?) -> ()) {
        
        var parsedResult: Any?
        
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
          print("JSON: \(parsedResult)")
            
        } catch let error as NSError{
            print("Could not parse the data as JSON: '\(data)'. Error: \(error.localizedDescription)")
            completionHandlerForFoundationObjects(nil, error)
        }
        
        completionHandlerForFoundationObjects(parsedResult as AnyObject?, nil)
    }
    
}
