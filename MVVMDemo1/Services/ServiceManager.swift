//
//  ServiceManager.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {

    
    let session: URLSession
    
    static let sharedInstance = ServiceManager()
    
    private override init() {
        session = URLSession.shared
    }

}

extension ServiceManager {
    
    func startWebRequest(withUrl urlString: String, completionHandler:@escaping(Data?, Error?)->Void) {
        let url = URL.init(string: urlString)!
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        
            guard error != nil else {
                completionHandler(data, nil)
                return
            }
            completionHandler(nil, error)
        
        }
        task.resume()
        
    }
}
