//
//  CompletedDays.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/12/21.
//

import Foundation


class CompletedDays {
    
    static var goal : Int = 0
    
    static var completedDays : [String] = []

    static func add(_ day : String) {
        completedDays.append(day);
    }

    static func get() -> [String] {
        return completedDays
    }
    

    static func setGoal(_ _goal : Int) {
        goal = _goal
    }
    
    static func getGoal() -> Int {
        return goal
    }
    
}
