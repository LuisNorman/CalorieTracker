//
//  ViewControllerConfirm.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/1/21.
//

import UIKit

class ViewControllerConfirm: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    var name : String?
    var age : String?
    var height : String?
    var weight : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = "Name: \(name ?? "Unknown")"
        ageLabel.text = "Age: \(age ?? "Unknown")"
        heightLabel.text = "Height: \(height ?? "Unknown")"
        weightLabel.text = "Weight: \(weight ?? "Unknown")"
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
