//
//  ViewControllerConfirmGoal.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/2/21.
//

import UIKit

class ViewControllerConfirmGoal: UIViewController {

    @IBOutlet weak var dailyGoalLabel: UILabel!
    
    var goal : String?
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dailyGoalLabel.text = "Daily calorie goal: \(goal ?? "Unknown") calories"
    }
    
    @IBAction func confimPressed(_ sender: UIButton) {
        let newG = Int(goal!)
        CompletedDays.setGoal(newG!)
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
