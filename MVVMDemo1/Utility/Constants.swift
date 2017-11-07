//
//  Constants.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation
struct Constants {
    
   enum Environment: String {
        case PROD = "https://your_Base_URL" //This is temporary, change as you want
        case DEV = "http://"
        case SQE = ""   //This is temporary, change as you want
    }
    
    struct API {
       static let MUSIC_URL = baseUrl + "api.androidhive.info/json/movies.json"
       static let TOP_APPS_URL = baseUrl + "phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=200/json"
    }
    
    static let baseUrl:String = Environment.DEV.rawValue
    
    
    
}
