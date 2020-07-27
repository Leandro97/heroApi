//
//  RequestHandler.swift
//  ui
//
//  Created by Leandro Martins on 26/07/20.
//  Copyright © 2020 Stant. All rights reserved.
//

import UIKit

public class RequestHandler {
    class func performRequest(json: [String: String], completion: @escaping (Data?, URLResponse?, Error?) -> Void){
        let url            = URL(string: "https://amiaheroapi.herokuapp.com/api")!
        let session        = URLSession.shared
        var request        = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let jsonData     = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            completion(data, response, error)
        })

        task.resume()
    }
}
