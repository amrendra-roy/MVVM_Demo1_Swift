//
//  Utility.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class Utility: NSObject {

    static func showAlert(withTitle: String, message: String, okBtn: String)->UIAlertController {
        let alert = UIAlertController.init(title: withTitle, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: okBtn, style: .cancel, handler: nil)
        alert.addAction(okAction)
        return alert
    }
    
    
    
    
    
    
}
