//
//  TestViewModel.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class TestViewModel: NSObject, TestProtocol {

    var status: Status {
        didSet {
            switch status {
            case .Failed:
                statusMessage  = "Failed"
            case .Running:
                statusMessage  = "Running"
            case .Success:
                statusMessage  = "Success"
            case .Nothing:
                statusMessage  = "Nothing is going on"
            }
        }
    }
    var statusMessage: String = "" {
        didSet{
            self.didChangedStatus?()
        }
    }
    var didChangedStatus: (() -> ())?
    
    
    func startWebServiceCall() {
        
        DispatchQueue.global().async {
            //Long task is going here
            self.status = .Running
            sleep(10)
            
            //task is done or mail
            let i = arc4random()%10
            if i<4 {
                self.status = .Failed
            }else{
                self.status = .Success
            }
        }
    }
    //This initalizer should initalize all prooperty of Protocol, like set status, statusMessage, i have set it default ""
    required init(status: Status) {
       self.status = .Nothing
        
    }
    
    
    
    
}
