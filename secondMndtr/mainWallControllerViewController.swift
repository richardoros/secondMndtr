//
//  mainWallControllerViewController.swift
//  secondMndtr
//
//  Created by eak on 24/05/2017.
//  Copyright © 2017 Richard and Casian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class mainWallControllerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var theImage: UIImageView!
    
    @IBAction func showPopUp(_ sender: Any) {
        let popVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        self.addChildViewController(popVC)
        popVC.view.frame = self.view.frame
        self.view.addSubview(popVC.view)
        popVC.didMove(toParentViewController: self)
    }
    
    @IBAction func addImgBtn(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController (title: "Image source", message: "chose an image", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil )
            }else{
                print("Camera Dose not work")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated:true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage ] as! UIImage
        theImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
