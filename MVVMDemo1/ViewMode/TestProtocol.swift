//
//  TestProtocol.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation


enum Status {
    case Running
    case Failed
    case Success
    case Nothing
}




protocol TestProtocol {
    
    
    var statusMessage: String { get set }
    
    var didChangedStatus: ( ()-> () )? { get set }
    
    var status: Status { get }
    
    init(status: Status);
}
