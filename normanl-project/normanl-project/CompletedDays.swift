//
//  CompletedDays.swift
//  normanl-project
//
//  Created by Luis Norman Jr on 3/12/21.
//

import Foundation

class CompletedDays {
    static var completedDays : [String] = []

    static func add(_ day : String) {
        completedDays.append(day);
    }

    static func get() -> [String] {
        return completedDays
    }
    
//    var completedDays : [String] {
//        get {
//            return self.completedDays
//        }
//        set(day) {
//            completedDays.append(contentsOf: day)
//        }
//    }
    
}
