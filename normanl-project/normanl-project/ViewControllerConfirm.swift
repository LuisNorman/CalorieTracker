//
//  ViewControllerConfirm.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/1/21.
//

import UIKit
import QuartzCore

class ViewControllerConfirm: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    var name : String?
    var age : String?
    var height : String?
    var weight : String?
    
    var goal : String?
    
    @IBOutlet weak var recommendation1: UIButton!
    @IBOutlet weak var recommendation2: UIButton!
    @IBOutlet weak var recommendation3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (nameLabel != nil) { // Sharing this VC  with another 
            nameLabel.text = "Name: \(name ?? "Unknown")"
            ageLabel.text = "Age: \(age ?? "Unknown")"
            heightLabel.text = "Height: \(height ?? "Unknown")"
            weightLabel.text = "Weight: \(weight ?? "Unknown")"
        }
        
        
        
    }
    
    @IBAction func recommendationSelected(_ sender: UIButton) {
        goal = String((sender.currentTitle?.suffix(4))!)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let confirmGoalViewController = segue.destination as? ViewControllerConfirmGoal {
            confirmGoalViewController.goal = goal
            confirmGoalViewController.name = name
        }
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
