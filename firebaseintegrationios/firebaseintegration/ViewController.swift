//
//  ViewController.swift
//  firebaseintegration
//
//  Created by Harnoor Singh on 4/8/19.
//  Copyright © 2019 Harnoor Singh. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtOutputNames: UITextView!
    
    @IBAction func onClickPublish(_ sender: Any) {
        if let fNameStr = txtFirstName.text, fNameStr != "" {
            let lNameStr = txtLastName.text
            
            
            let id = ref.childByAutoId().key
            ref.child("names").child(id!).setValue(["id":id,"firstName":fNameStr,"lastName":lNameStr])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
//         ref.child("names").observeSingleEvent(of: .value, with: { (snapshot) in
        ref.child("names").observe(.childAdded, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let fName = value?["firstName"] as? String ?? ""
            let lName = value?["lastName"] as? String ?? ""
            
            self.txtOutputNames.text.append(fName + "                     " + lName + "\n")
            self.txtOutputNames.resignFirstResponder() // Hide Keyboard
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
