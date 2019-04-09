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
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBAction func onClickPublish(_ sender: Any) {
        if let fNameStr = txtFirstName.text, fNameStr != "" {
            let lNameStr = txtLastName.text
            let ref = Database.database().reference()
            
            let id = ref.childByAutoId().key
            ref.child("names").child(id!).setValue(["id":id,"firstName":fNameStr,"lastName":lNameStr])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

