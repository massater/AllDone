//
//  ToDoView.swift
//  AllDone
//
//  Created by muttley on 11/11/22.
//

import SwiftUI

struct ToDoView: View {
    var todo: Todo
    
    @ObservedObject var viewMode: ToDoViewModel
    
    var body: some View {
        HStack {
            Button {
                if todo.completed {
                    viewMode.completeToDo(todoID: todo.documentID ?? "", isCompleted: false)
                } else {
                    viewMode.completeToDo(todoID: todo.documentID ?? "")
                }
            } label: {
                Image(systemName: todo.completed ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("lightBlue"))
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(todo.title)
                    .font(.system(size: 18))
                
                if todo.description != "" {
                    HStack {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .foregroundColor(Color("lightBlue"))
                        
                        Text(todo.description)
                            .font(.system(size: 14))
                            .foregroundColor(Color(.systemGray2))
                    }
                }
            }  // end of VStack
            .padding(.leading, 10)
            
            Spacer()
            
            Button {
                viewMode.deleteToDo(todoID: todo.documentID ?? "")
            } label: {
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.red)
            }

            
        } // end of HStack
        .padding(20)
        .frame(width: UIScreen.main.bounds.size.width - 25, height: 70)
        .background(Color(.systemGray))
        .cornerRadius(20)
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView(todo: todo01, viewMode: ToDoViewModel())
    }
}
