//
//  Protocol_ViewMode_TestViewController.swift
//  MVVMDemo1
//
//  Created by Amrendra on 07/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class Protocol_ViewMode_TestViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    var viewTestModel: TestViewModel! {
        didSet {
            self.viewTestModel.didChangedStatus = {
                DispatchQueue.main.async {
                    if self.viewTestModel.status == .Success || self.viewTestModel.status == .Failed {
                        self.indicator.stopAnimating()
                    }
                    self.statusLbl.text = self.viewTestModel.statusMessage

                }
            }
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTappedRefereceButton(_ sender: UIButton) {
        indicator.startAnimating()
        self.viewTestModel.startWebServiceCall()
    }
}
