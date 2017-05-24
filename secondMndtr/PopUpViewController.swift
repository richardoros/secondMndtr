//
//  PopUpViewController.swift
//  secondMndtr
//
//  Created by eak on 24/05/2017.
//  Copyright © 2017 Richard and Casian. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitFromView(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    

}
