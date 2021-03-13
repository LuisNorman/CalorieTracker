//
//  ViewControllerDays.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/12/21.
//

import UIKit

class ViewControllerDays: UIViewController {

    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var calories : String?

    var day : Int?
    
    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Update detail view based on data passed from table view
    override func viewWillAppear(_ animated: Bool) {
        if let cals = calories {
            caloriesLabel.text = "\(cals) calories"
            // Display if goal was reached or not
            if (CompletedDays.getGoal() > Int(cals)!) {
                statusLabel.text = "Wooohooo - you did it!"
                progressBar.progressTintColor = .green
            }
            else {
                statusLabel.text = "Uh Oh! You didn't meet your goal."
                
                progressBar.progressTintColor = .red
                progressBar.progress = 0.25
            }
        }
        // Display day
        if let d = day {
            dayLabel.text = "Day \(d + 1)"
        }
        
        goalLabel.text = "Goal: \(CompletedDays.getGoal())"
        
        
        
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
