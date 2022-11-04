//
//  ToDo.swift
//  AllDone
//
//  Created by muttley on 11/4/22.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Todo: Identifiable, Decodable {
    
    @DocumentID var id: String? = UUID().uuidString
    let ownerId: String
    var title: String
    var description: String
    var ToDoType: String
    var completed: Bool = false
    var documentID: String? = ""
    
    func getType() -> SelectedButton {
        switch ToDoType {
        case "Groceries": return .groceries
        case "Work": return .work
        case "School": return .school
        case "Home": return .home
        case "Personal": return .personal
        default: return .extra
        }
    }
}
