//
//  AppModel.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class AppModel: NSObject {

    var imageUrl: String!
    var summary: String?
    var price: String?
    var rigths: String?
    var title: String!
    var link: String?
    var category: String?
    var releaseDate: String?

    init(withDictionary dict: NSDictionary) {
        imageUrl = (dict["im:image"] as? [NSDictionary])?.first! ["label"] as! String
        summary = (dict["summary"] as? NSDictionary)?["label"] as? String
        price = (dict["im:price"] as? NSDictionary)?["label"] as? String
        rigths = (dict["rights"] as? NSDictionary)?["label"] as? String
        title = (dict["title"] as? NSDictionary)?["label"] as? String ?? ""
        link = (((dict["link"] as? NSDictionary)?["attributes"])as? NSDictionary)?["href"] as? String
        category = (((dict["category"] as? NSDictionary)?["attributes"])as? NSDictionary)?["label"] as? String
        releaseDate = (((dict["im:releaseDate"] as? NSDictionary)?["attributes"])as? NSDictionary)?["label"] as? String ?? ""

        
        
        
    }
    
}
