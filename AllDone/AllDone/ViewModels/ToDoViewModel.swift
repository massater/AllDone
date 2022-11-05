//
//  ToDoViewModel.swift
//  AllDone
//
//  Created by muttley on 11/4/22.
//

import SwiftUI
import Firebase


class ToDoViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    @Published var showCreateToDoView: Bool = false
    @Published var filterToDoSelected: SelectedButton = .all
    @Published var todosFiltered: [Todo] = []
    
    init() {
        loadToDos()
    }
    
    func loadToDos() {
        guard let user = AuthViewModel.shared.currentUser else {
            print("No Users to load from")
            return
        }
        
        let query = COLLECTION_USERS.document(user.uid ).collection("todos").order(by: "", descending: false)
        query.getDocuments { snapshot , _ in
            guard let documents = snapshot?.documents else { print("There are no Docs?!?"); return }
            for doc in documents {
                print("Doc: \(doc)")
                let ownerId = doc["ownerId"] as! String
                let title = doc["title"] as! String
                let description = doc["description"] as! String
                let ToDoType = doc["ToDoType"] as! String
                let completed = doc["completed"] as! Bool
                let documentID = doc["documentID"] as! String

                self.todos.append(Todo(ownerId: ownerId, title: title, description: description, ToDoType: ToDoType, completed: completed, documentID: documentID))
                
            }
            
            for index in stride(from: 0, to: self.todos.count, by: self.todos.count) {
                self.todos[index].documentID = documents[index].documentID
            }
            
            self.todosFiltered = self.todos
            
            if self.filterToDoSelected != .all {
                self.todosFiltered = self.todos.filter { todos in
                    return todos.ToDoType == self.filterToDoSelected.rawValue
                }
            }

            
            //self.todosArray = documents.compactMap({ s in try? s.data(as: Todo.self)})
            
            //self.todosArray = documents.compactMap({ $0.data() })
//            self.todosArray = documents.compactMap{ queryDocumentSnapshot -> Todo? in
//                return try? queryDocumentSnapshot.data(as: Todo.self)
//            }
            
        }
    }
    
    func uploadToDo(todo: Todo) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let data: [String: Any] = ["title": todo.title,
                                   "description": todo.description,
                                   "ToDoType": todo.ToDoType,
                                   "completed": todo.completed,
                                   "ownerId": user.id ?? ""]
        
        COLLECTION_USERS.document(user.id ?? "").collection("todos").addDocument(data: data) { error in
            if let error = error {
                print("Error: Upload ToDo - \(error.localizedDescription)")
                return
            }
            self.loadToDos()
        }
    }
    
    func deleteToDo(todoID: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("todos").document(todoID).delete() { error in
            if let error = error {
                print("Error: Delete ToDo - \(error.localizedDescription)")
                return
            }
            self.loadToDos()
        }
    }
    
    
    func completeToDo(todoID: String, isCompleted: Bool = true) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("todos").document(todoID).updateData(["completed": isCompleted] ) { error in
            if let error = error {
                print("Error: Completed ToDo - \(error.localizedDescription)")
                return
            }
            self.loadToDos()
        }
    }
}
