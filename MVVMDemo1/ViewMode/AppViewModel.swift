//
//  AppViewModel.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class AppViewModel: NSObject, AppListProtocol {
    
    var appList: [AppModel] = [] {
        didSet {
            self.didChangedAppListing?()
        }
    }
    
    var numberOfRowInSection: Int = 0 {
        didSet {
            print("Perform any set task for viewmodel. I m not using this")
        }
        willSet {
        
        }
    }

    var didChangedAppListing: (() -> ())?

    var testComputedValueReadWrite: String? {
        didSet {
            print("Perform what you want on set this variable")
        }
        willSet {
            print("Perform what you want before setting this value")

        }
    }
    
    func fetchAppList() {
        ServiceManager.sharedInstance.startWebRequest(withUrl: Constants.API.TOP_APPS_URL) { (data: Data?, error: Error?) in
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    print("AppViewModel json invalid")
                    return
                }
                
                let arrOfEntry = (json["feed"] as? NSDictionary)?["entry"] as? [NSDictionary]
                print("Array of entry is = \(String(describing: arrOfEntry))")
                self.appList = self.parseAppList(from: arrOfEntry)
                
                
            }catch {
                print("AppViewModel fetchAppList catch block")
            }
        }
    }
    
    func parseAppList(from list: [NSDictionary]?) -> [AppModel] {
        var arrOfModels = [AppModel]()
        
        guard ((list?.count) != nil) else {
            print("Parsing app list is empty")
            return arrOfModels
        }
        
        
        for dict in list! {
            let model = AppModel(withDictionary: dict)
            arrOfModels.append(model)
        }
        return arrOfModels
    }
    
}
