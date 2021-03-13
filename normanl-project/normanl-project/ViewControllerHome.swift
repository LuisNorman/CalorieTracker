
import UIKit

class ViewControllerHome: UIViewController {

    @IBOutlet weak var calorieLabel: UILabel!
    var incomingCalories : Int?
    var currentCalorieInt : Int = 0
//    var completedDays : [String] = []
    
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeButton.backgroundColor = .clear
        completeButton.layer.cornerRadius = 5
        completeButton.layer.borderWidth = 1
        completeButton.layer.borderColor = UIColor.black.cgColor // CG api
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let newCalories = incomingCalories {
            currentCalorieInt = currentCalorieInt + newCalories // Increment current calorie count
            calorieLabel.text = "\(currentCalorieInt) calories"
        }
        
    }

    // Need to for navigation after submitting drink or food
    @IBAction func unwindToHome(_ segue : UIStoryboardSegue) {

    }

    // Add the completed day to array and reset values
    @IBAction func completePressed(_ sender: UIButton) {
        if (currentCalorieInt > 0) {
            CompletedDays.add(calorieLabel.text!.components(separatedBy: " ").first!)
//            completedDays.append(calorieLabel.text!)
            currentCalorieInt = 0
            calorieLabel.text = "0 calories"
            incomingCalories = 0
        }
        else {
            invalidInput(_title: "No calories!", _message: "You must have at least 1 calorie in order to submit.")
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
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
