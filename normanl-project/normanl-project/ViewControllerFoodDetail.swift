//
//  ViewControllerFoodDetail.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/2/21.
//

import UIKit

class ViewControllerFoodDetail: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sizeTextField: UITextField!
    
    
    var food : FoodItem?
    var currentCalorie : Int? = 0
    var refresh : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // Update detail view based on data passed from table view
    override func viewWillAppear(_ animated: Bool) {
        if (!refresh) {
            if let foodItem = food {
                titleLabel.text = foodItem.name
                if (foodItem.type == .custom && foodItem.name != "Pizza (sausage)") {
                    var size : String
                    if (foodItem.size == 1.0) {
                        size = "Small"
                    }
                    else if (foodItem.size == 2.0) {
                        size = "Medium"
                    }
                    else {
                        size = "Large"
                    }
                    
                    descriptionLabel.text = "\(size): \(foodItem.calories) calories"
                }
                
                else if (foodItem.name == "Pizza (sausage)") {
                    descriptionLabel.text = "1 slice: \(foodItem.calories) calories"
                }
                
                else {
                    descriptionLabel.text = "\(foodItem.size) \(foodItem.type): \(foodItem.calories) calories"
                }
                currentCalorie = foodItem.calories
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
    
    // Convert calories
    @IBAction func enterPressed(_ sender: UIButton) {
        guard let foodItem = food
        else { return }
        
        guard let newSize = sizeTextField.text
        else { return }
        
        
        if (newSize != "") {
            
            // Convert cups
            if (foodItem.type == .cups) {
                let newCalories = Int((Float(foodItem.calories)/8.0) * (Float(newSize)! * 8.0))
                descriptionLabel.text = "\(newSize) \(foodItem.type): \(newCalories) calories"
                currentCalorie = newCalories
            }
            
            // Convert lbs with base 0.5 lb
            else if (foodItem.type == .lbs && foodItem.size == 0.5) {
                let newCalories = Int((Float(foodItem.calories)/8.0) * (Float(newSize)! * 16.0))
                descriptionLabel.text = "\(newSize) \(foodItem.type): \(newCalories) calories"
                currentCalorie = newCalories
            }
            
            // Convert lbs with base 1 lb
            else if (foodItem.type == .lbs && foodItem.size == 1.0) {
                let newCalories = Int((Float(foodItem.calories)/16.0) * (Float(newSize)! * 16.0))
                descriptionLabel.text = "\(newSize) \(foodItem.type): \(newCalories) calories"
                currentCalorie = newCalories
            }
            
            // Convert lbs with base 0.5lbs
            else if (foodItem.type == .custom && foodItem.name == "Pizza (sausage)") {
                let newCalories = foodItem.calories * Int(newSize)!
                descriptionLabel.text = "\(newSize) slice(s): \(newCalories) calories"
                currentCalorie = newCalories
            }
            
            // Convert small small/med/large
            else if (foodItem.type == .custom && foodItem.size == 1.0) {
                
                if (Int(newSize) == 1) {
                    let newCalories = Int(foodItem.calories) // Compute new calories
                    descriptionLabel.text = "Small: \(newCalories) calories"
                    currentCalorie = newCalories
                }
                else if (Int(newSize) == 2) {
                    let newCalories = Int(foodItem.calories * 2) // Compute new calories
                    descriptionLabel.text = "Medium: \(newCalories) calories"
                    currentCalorie = newCalories
                }
                if (Int(newSize) == 3) {
                    let newCalories = Int(foodItem.calories * 3) // Compute new calories
                    descriptionLabel.text = "Large: \(newCalories) calories"
                    currentCalorie = newCalories
                }
            }
            
            // Convert medium small/med/large
            else if (foodItem.type == .custom && foodItem.size == 2.0) {
                
                if (Int(newSize) == 1) {
                    let newCalories = (foodItem.calories/2 * 1) // Compute new calories
                    descriptionLabel.text = "Small: \(newCalories) calories"
                    currentCalorie = newCalories
                }
                else if (Int(newSize) == 2) {
                    let newCalories = Int(foodItem.calories/2 * 2) // Compute new calories
                    descriptionLabel.text = "Medium: \(newCalories) calories"
                    currentCalorie = newCalories
                }
                if (Int(newSize) == 3) {
                    let newCalories = Int(foodItem.calories/2 * 3) // Compute new calories
                    descriptionLabel.text = "Large: \(newCalories) calories"
                    currentCalorie = newCalories
                }
            }
            
            // Convert large to small/med/large
            else if (foodItem.type == .custom && foodItem.size == 3.0) {
                
                if (Int(newSize) == 1) {
                    let newCalories = Int(foodItem.calories/3 * 1) // Compute new calories
                    descriptionLabel.text = "Small: \(newCalories) calories"
                    currentCalorie = newCalories
                }
                else if (Int(newSize) == 2) {
                    let newCalories = Int(foodItem.calories/3 * 2) // Compute new calories
                    descriptionLabel.text = "Medium: \(newCalories) calories"
                    currentCalorie = newCalories
                }
                if (Int(newSize) == 3) {
                    let newCalories = Int(foodItem.calories/3 * 3) // Compute new calories
                    descriptionLabel.text = "Large: \(newCalories) calories"
                    currentCalorie = newCalories
                }
            }
            
            else {
                //invalid something
            }
            
            sizeTextField.text = "" // clear text field
            sizeTextField.resignFirstResponder() // dismiss decimal pad (if needed)
            
        }
    } // end enter pressed
    
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
    
}
