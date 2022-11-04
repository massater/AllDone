//
//  SelectedButton.swift
//  AllDone
//
//  Created by muttley on 11/4/22.
//

import Foundation


enum SelectedButton: String {
    case all = "All"
    case groceries = "Groceries"
    case work = "Work"
    case school = "School"
    case home = "Home"
    case personal = "Personal"
    case extra = "Extra"
    
    func getValue() -> String {
        return self.rawValue
    }
}
