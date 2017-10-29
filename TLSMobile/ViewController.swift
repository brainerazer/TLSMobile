//
//  ViewController.swift
//  TLSMobile
//
//  Created by Bohdan Rybak on 21.10.17.
//  Copyright © 2017 Bohdan Rybak. All rights reserved.
//

import UIKit

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}

func generateRandomBytes() -> String? {
    
    var keyData = Data(count: 32)
    let result = keyData.withUnsafeMutableBytes {
        (mutableBytes: UnsafeMutablePointer<UInt8>) -> Int32 in
        SecRandomCopyBytes(kSecRandomDefault, keyData.count, mutableBytes)
    }
    if result == errSecSuccess {
        return keyData.hexEncodedString()
    } else {
        print("Problem generating random bytes")
        return nil
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var clientRandomTextField: UITextField!
    @IBOutlet weak var handshakePushButton: UIButton!
    
    var clientRandomHex: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        clientRandomTextField.delegate = self
        self.clientRandomHex = generateRandomBytes()
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

