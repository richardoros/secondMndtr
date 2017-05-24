//
//  HomeViewController.swift
//  secondMndtr
//
//  Created by Richard Oros on 21/05/2017.
//  Copyright © 2017 Richard and Casian. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    
    
    @IBAction func logOutAction(_ sender: UIButton) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "Home")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
                print("Couldn't find Home or Login storyboard ID")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    
    
    
}
