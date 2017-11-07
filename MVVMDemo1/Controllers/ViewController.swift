//
//  ViewController.swift
//  MVVMDemo1
//
//  Created by Amrendra on 06/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var viewModel = AppViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.didChangedAppListing = {
                    print("this model array = \(self.viewModel.appList)")
                }
        
        
        self.viewModel.testComputedValueReadWrite = "Test 1"
        print(self.viewModel.testComputedValueReadWrite ?? "Test")
        
        
    }
    
    @IBAction func startWebRequest(_ sender: UIButton) {
        self.viewModel.fetchAppList()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Protocol_ViewMode_TestVC" {
            let vc = segue.destination as! Protocol_ViewMode_TestViewController
            vc.viewTestModel = TestViewModel(status: .Nothing)
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    @IBAction func moveToNextScreen(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Protocol_ViewMode_TestVC", sender: nil)
    }

}

