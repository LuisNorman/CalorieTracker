//
//  ViewController.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nametextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // background touched: dismiss all possible open text fields
    @IBAction func backgroundToched(_ sender: UIControl) {
        nametextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
    // dismiss current text field when done pressed
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        if (nametextField.text == "") {
            invalidInput(_title: "Blank Name", _message: "Please enter your name in the name text field.")
        }
        
        else if (ageTextField.text == "") {
            invalidInput(_title: "Empty Age", _message: "Please enter your age in the age text field.")
        }
        
        else if (heightTextField.text == "") {
            invalidInput(_title: "Empty Height", _message: "Please enter your height in the age text field.")
        }
        
        else if (weightTextField.text == "") {
            invalidInput(_title: "Empty Weight", _message: "Please enter your weight in the weight text field.")
        }
        
        else {
            
        }
    }
    
    @IBAction func invalidInput(_title : String, _message : String) {
        let title = _title
        let message = _message
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:"OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let confirmViewController = segue.destination as? ViewControllerConfirm {
            confirmViewController.age = ageTextField.text
            confirmViewController.name = nametextField.text
            confirmViewController.height = heightTextField.text
            confirmViewController.weight = weightTextField.text
        }
    }
    
    


}

