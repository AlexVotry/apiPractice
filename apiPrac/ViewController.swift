//
//  ViewController.swift
//  apiPrac
//
//  Created by Alex Votry on 2/19/17.
//  Copyright © 2017 Alex Votry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var criteriaLabel: UILabel!
    @IBOutlet weak var criteriaTextField: UITextField!

    var area: String?

    override func viewDidLoad() { // content view is created and loaded from storyboard
        super.viewDidLoad()

        // Handle the text field's user input through delegate callbacks.
        criteriaTextField.delegate = self
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keyboard
        textField.resignFirstResponder()
        return true
    }

    private func textFieldShouldEndEditing(_ textField: UITextField) {
        area = textField.text!

    }
}
