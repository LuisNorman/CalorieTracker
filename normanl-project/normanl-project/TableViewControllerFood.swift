//
//  TableViewController.swift
//  normanl-assignment8
//
//  Created by Luis Norman Jr on 2/22/21.
//

import UIKit

// Custom food item type
class FoodItem {
    enum `Type`: String {
        case lbs = "lbs"
        case cups = "cups"
        case custom = "custom"
    }
    var name : String
    var calories : Int
    var size : Float
    var type : Type
    
    init (nameOfFood: String, measurementType: Type, numOfCalories: Int, sizeOfFood: Float) {
        name = nameOfFood
        type = measurementType
        calories = numOfCalories
        size = sizeOfFood
    }
    
}

class TableViewControllerFood: UITableViewController {
    
    // Create list of foods
    let foods = [
        FoodItem(nameOfFood: "Atlantic Salmon", measurementType: .lbs, numOfCalories: 323, sizeOfFood: 0.5),
        FoodItem(nameOfFood: "Filet Mignon", measurementType: .lbs, numOfCalories: 493, sizeOfFood: 0.5),
        FoodItem(nameOfFood: "Mashed Potatoes", measurementType: .cups, numOfCalories: 256, sizeOfFood: 1.0),
        FoodItem(nameOfFood: "Pho", measurementType: .custom, numOfCalories: 450, sizeOfFood: 3.0),
        FoodItem(nameOfFood: "NY Strip", measurementType: .lbs, numOfCalories: 437, sizeOfFood: 0.5),
        FoodItem(nameOfFood: "Baby Back Ribs", measurementType: .lbs, numOfCalories: 816, sizeOfFood: 1),
        FoodItem(nameOfFood: "Fried Catfish", measurementType: .lbs, numOfCalories: 520, sizeOfFood: 0.5),
        FoodItem(nameOfFood: "Spaghetti and Meatballs", measurementType: .custom, numOfCalories: 412, sizeOfFood: 1),
        FoodItem(nameOfFood: "Shrimp Alfredo Fettuccine", measurementType: .custom, numOfCalories: 327, sizeOfFood: 1),
        FoodItem(nameOfFood: "Meatloaf", measurementType: .lbs, numOfCalories: 480, sizeOfFood: 0.5),
        FoodItem(nameOfFood: "Beef Stir Fry", measurementType: .lbs, numOfCalories: 420, sizeOfFood: 0.5),
        FoodItem(nameOfFood: "Pizza (sausage)", measurementType: .custom, numOfCalories: 320, sizeOfFood: 1.0),
        FoodItem(nameOfFood: "Chili with Meat", measurementType: .cups, numOfCalories: 256, sizeOfFood: 1.0),
        FoodItem(nameOfFood: "Chicken Noodle Soup", measurementType: .cups, numOfCalories: 87, sizeOfFood: 1.0),
        FoodItem(nameOfFood: "Shrimp Fried Rice", measurementType: .cups, numOfCalories: 244, sizeOfFood: 1.0),
        FoodItem(nameOfFood: "Fried Pork Chop", measurementType: .custom, numOfCalories: 326, sizeOfFood: 3.0),
        FoodItem(nameOfFood: "Mac and Cheese", measurementType: .cups, numOfCalories: 310, sizeOfFood: 1.0),
        FoodItem(nameOfFood: "White Rice", measurementType: .cups, numOfCalories: 206, sizeOfFood: 1.0),
        FoodItem(nameOfFood: "Brown Rice", measurementType: .cups, numOfCalories: 216, sizeOfFood: 1.0),
        FoodItem(nameOfFood: "Pot Roast", measurementType: .lbs, numOfCalories: 672, sizeOfFood: 0.5)
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "food", for: indexPath)
        cell.textLabel?.text = food.name
        return cell
    }
    
    // pass data to detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? ViewControllerFoodDetail {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                detailViewController.food = foods[indexPath.row]
            }
        }
    }
    
//    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        let food = foods[indexPath.row]
//        let title = food.name
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
