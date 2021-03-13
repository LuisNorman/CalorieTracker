//
//  ViewControllerDrinkDetail.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/5/21.
//

import UIKit

class ViewControllerDrinkDetail: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sizeTextField: UITextField!
    
    
    var drink : DrinkItem?
    var currentCalorie : Int? = 0
    var refresh : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Update detail view based on data passed from table view
    override func viewWillAppear(_ animated: Bool) {
        if (!refresh) {
            if let drinkItem = drink {
                titleLabel.text = drinkItem.name
                
                let defaultSize = "1.0 cup"
                descriptionLabel.text = "\(defaultSize): \(drinkItem.calories) calories"
                currentCalorie = drinkItem.calories
                refresh = true
            }
        }

        else {
            self.navigationController?.popToRootViewController(animated: false)
            refresh = false
        }
    }
    
    // Pass calories to home page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let homeViewController = segue.destination as? ViewControllerHome {
            homeViewController.incomingCalories = currentCalorie
        }
    }
    
    // dismiss decimal pad
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    // dismiss decimal pad
    @IBAction func backgroundTouched(_ sender: UIControl) {
        sizeTextField.resignFirstResponder()
    }
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        if (sizeTextField.text == "0") {
            invalidInput(_title: "No calories detected", _message: "Please enter a measurement to submit.")
        }
        else {
            if let from = presentingViewController as? ViewControllerHome {
                from.incomingCalories = currentCalorie
            }
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
    
    
    
    // Convert calories
    @IBAction func enterPressed(_ sender: UIButton) {
        guard let drinkItem = drink
        else { return }
        
        guard let newSize = sizeTextField.text
        else { return }
        
        
        if (newSize != "") {
            
            // Convert cups
            
            let newCalories = Int((Float(drinkItem.calories)/8.0) * (Float(newSize)! * 8.0))
            if (Double(newSize) == 1.0) {
                descriptionLabel.text = "\(newSize) cup: \(newCalories) calories"
            }
            else {
                print(newCalories)
                descriptionLabel.text = "\(newSize) cups: \(newCalories) calories"
            }
            
            currentCalorie = newCalories
            

            sizeTextField.text = "" // clear text field
            sizeTextField.resignFirstResponder() // dismiss decimal pad (if needed)
            
        }
    } // end enter pressed

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
