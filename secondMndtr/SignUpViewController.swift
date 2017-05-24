//
//  SignUpViewController.swift
//  secondMndtr
//
//  Created by Richard Oros on 21/05/2017.
//  Copyright © 2017 Richard and Casian. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var backToLoginScreen: UIButton!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBAction func createAccount(_ sender: UIButton) {
        if emailField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailField.text!, password: passField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    
    }
    
    








}
