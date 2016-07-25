//
//  SecondViewController.swift
//  Todo List
//
//  Created by Ashley Donohoe on 7/24/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit


// Make screen with label, textfield, and add button

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var addItemTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addItem(_ sender: AnyObject) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items: [String]
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(addItemTextField.text!)
        } else {
            items = [addItemTextField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        addItemTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

