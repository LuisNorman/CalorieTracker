//
//  ViewControllerDays.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/12/21.
//

import UIKit

class ViewControllerDays: UIViewController {

    @IBOutlet weak var foodsAndDrinks: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    var calories : String?
    var foodsDrinks : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    
    // Update detail view based on data passed from table view
    override func viewWillAppear(_ animated: Bool) {
        caloriesLabel.text = "Calories: 1750"
        foodsAndDrinks.text = "Salmon\nGingerAle\nBurrito"
        [foodsAndDrinks .sizeToFit()]
        
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
