//
//  ViewController.swift
//  TLSMobile
//
//  Created by Bohdan Rybak on 21.10.17.
//  Copyright © 2017 Bohdan Rybak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var clientRandomTextField: UITextField!
    @IBOutlet weak var handshakePushButton: UIButton!
    
    var clientRandomHex: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        clientRandomTextField.delegate = self
        self.clientRandomHex = generateRandomBytes()?.hexEncodedString()
        self.clientRandomTextField.text = self.clientRandomHex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        clientRandomHex = textField.text
    }


}

