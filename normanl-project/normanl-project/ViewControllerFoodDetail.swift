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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Update detail view based on data passed from table view
    override func viewWillAppear(_ animated: Bool) {
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
            }
            
            // Convert lbs with base 0.5 lb
            else if (foodItem.type == .lbs && foodItem.size == 0.5) {
                let newCalories = Int((Float(foodItem.calories)/8.0) * (Float(newSize)! * 16.0))
                descriptionLabel.text = "\(newSize) \(foodItem.type): \(newCalories) calories"
            }
            
            // Convert lbs with base 1 lb
            else if (foodItem.type == .lbs && foodItem.size == 1.0) {
                let newCalories = Int((Float(foodItem.calories)/16.0) * (Float(newSize)! * 16.0))
                descriptionLabel.text = "\(newSize) \(foodItem.type): \(newCalories) calories"
            }
            
            // Convert lbs with base 0.5lbs
            else if (foodItem.type == .custom && foodItem.name == "Pizza (sausage)") {
                let newCalories = foodItem.calories * Int(newSize)!
                descriptionLabel.text = "\(newSize) slice(s): \(newCalories) calories"
            }
            
            // Convert small small/med/large
            else if (foodItem.type == .custom && foodItem.size == 1.0) {
                
                if (Int(newSize) == 1) {
                    let newCalories = Int(foodItem.calories) // Compute new calories
                    descriptionLabel.text = "Small: \(newCalories) calories"
                }
                else if (Int(newSize) == 2) {
                    let newCalories = Int(foodItem.calories * 2) // Compute new calories
                    descriptionLabel.text = "Medium: \(newCalories) calories"
                }
                if (Int(newSize) == 3) {
                    let newCalories = Int(foodItem.calories * 3) // Compute new calories
                    descriptionLabel.text = "Large: \(newCalories) calories"
                }
            }
            
            // Convert medium small/med/large
            else if (foodItem.type == .custom && foodItem.size == 2.0) {
                
                if (Int(newSize) == 1) {
                    let newCalories = (foodItem.calories/2 * 1) // Compute new calories
                    descriptionLabel.text = "Small: \(newCalories) calories"
                }
                else if (Int(newSize) == 2) {
                    let newCalories = Int(foodItem.calories/2 * 2) // Compute new calories
                    descriptionLabel.text = "Medium: \(newCalories) calories"
                }
                if (Int(newSize) == 3) {
                    let newCalories = Int(foodItem.calories/2 * 3) // Compute new calories
                    descriptionLabel.text = "Large: \(newCalories) calories"
                }
            }
            
            // Convert large to small/med/large
            else if (foodItem.type == .custom && foodItem.size == 3.0) {
                
                if (Int(newSize) == 1) {
                    let newCalories = Int(foodItem.calories/3 * 1) // Compute new calories
                    descriptionLabel.text = "Small: \(newCalories) calories"
                }
                else if (Int(newSize) == 2) {
                    let newCalories = Int(foodItem.calories/3 * 2) // Compute new calories
                    descriptionLabel.text = "Medium: \(newCalories) calories"
                }
                if (Int(newSize) == 3) {
                    let newCalories = Int(foodItem.calories/3 * 3) // Compute new calories
                    descriptionLabel.text = "Large: \(newCalories) calories"
                }
            }
            
            else {
                //invalid something
            }
            
            sizeTextField.text = "" // clear text field
            sizeTextField.resignFirstResponder() // dismiss decimal pad (if needed)
            
        }
        
    }
}
