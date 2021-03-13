//
//  TableViewControllerDrinks.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/5/21.
//

import UIKit

// Custom food item type
class DrinkItem {
    var name : String
    var calories : Int
    var size : Float
    
    init (nameOfFood: String, numOfCalories: Int, sizeOfFood: Float) {
        name = nameOfFood
        calories = numOfCalories
        size = sizeOfFood
    }
    
}


class TableViewControllerDrinks: UITableViewController {
    
    
    let drinks = [
        DrinkItem(nameOfFood: "Coca Cola",numOfCalories: 128, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Milk", numOfCalories: 103, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Almond Milk", numOfCalories: 60, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Red Bull", numOfCalories: 112, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Sprite", numOfCalories: 96, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Orange Juice", numOfCalories: 111, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Apple Juice", numOfCalories: 113, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Dr. Pepper", numOfCalories: 100, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Coffee", numOfCalories: 1, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Gatorade", numOfCalories: 63, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Kumbocha", numOfCalories: 30, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Cranberry Juice", numOfCalories: 117, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Half & Half Tea", numOfCalories: 315, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Root Beer", numOfCalories: 104, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "Ginger Ale", numOfCalories: 80, sizeOfFood: 1.0),
        DrinkItem(nameOfFood: "7UP", numOfCalories: 101, sizeOfFood: 1.0)
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
        return drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drink = drinks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "drink", for: indexPath)
        cell.textLabel?.text = drink.name
        return cell
    }

    // pass data to detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? ViewControllerDrinkDetail {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                detailViewController.drink = drinks[indexPath.row]
            }
        }
    }

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
