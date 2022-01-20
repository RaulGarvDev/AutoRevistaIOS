//
//  ViewController.swift
//  AutoRevista
//
//  Created by raul gonzalez de la aleja ruiz valdepeñas on 23/12/21.
//

import UIKit
import MessageUI

class Main: UIViewController, MFMailComposeViewControllerDelegate{
    
    //Outlets
    
    @IBOutlet weak var imagenLogo: UIImageView!
    @IBOutlet weak var botonWeb: UIButton!
    
    @IBOutlet weak var contactoEmail: UIBarButtonItem!
    @IBOutlet weak var contactoTelefono: UIBarButtonItem!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //Actions
    
    
    @IBAction func botonWeb(_ sender: Any) {
       
    }
    
    
    @IBAction func contactoEmailAction(_ sender: Any) {
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
         
        // Configure the fields of the interface.
        composeVC.setToRecipients(["emporio555@hotmail.com"])
        composeVC.setSubject("Hello!")
        composeVC.setMessageBody("Hello from California!", isHTML: false)
         
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
        
        func mailComposeController(controller: MFMailComposeViewController,
                                   didFinishWithResult result: MFMailComposeResult, error: NSError?) {
            // Check the result or perform other tasks.
            
            // Dismiss the mail compose view controller.
            controller.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func contactoTelefonoAction(_ sender: Any) {
        
        callNumber(phoneNumber: "+34619137015")
     
    }
    
    
    //Funciones
    
    private func callNumber(phoneNumber: String){
        
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
        
        
    }
    

    
}


