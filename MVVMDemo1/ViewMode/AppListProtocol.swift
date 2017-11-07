//
//  AppListProtocol.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation
protocol AppListProtocol: class {
    
    var numberOfRowInSection: Int { get }
    var testComputedValueReadWrite: String? { get set }
    var didChangedAppListing: ( ()->() )? { get set }
    
    
    
    
    
    
}
