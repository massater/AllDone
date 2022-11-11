//
//  CreateTodoView.swift
//  AllDone
//
//  Created by muttley on 11/11/22.
//

import SwiftUI

struct CreateTodoView: View {
    
    var user: AppUser
    @State var title: String = ""
    @State var TodoDescription: String = ""
    @State var TodoType: String = ""
    @State var completed: Bool = false
    
    @ObservedObject var viewModel: ToDoViewModel
    
    var body: some View {
        VStack {
            
            ToDoButtonStackView(viewModel: viewModel)
                .padding()
                .padding(.top)
            
            TodoTextField(text: $title, placeholder: "Todo...")
                .padding([.horizontal, .bottom])
            
            CustomTextEditor(text: $TodoDescription, placeholder: Text("Description..."), imageName: "line.3.horizontal", foregroundColor: .gray)
                .padding([.horizontal, .bottom])
            
            HStack {
                Button {
                    viewModel.uploadToDo(todo: Todo(ownerId: user.id ?? "", title: title, description: TodoDescription, ToDoType: viewModel.filterToDoSelected == .all ? "Extra" : viewModel.filterToDoSelected.rawValue, completed: false))
                    viewModel.showCreateToDoView = false
                } label: {
                    CreateTodoButton()
                }
                
                Button {
                    viewModel.showCreateToDoView = false
                } label: {
                    CancelTodoButton()
                }

            } // end HStack
            
            Spacer()
            
        } // end VSTack
        .frame(width: UIScreen.main.bounds.size.width - 100, height: 360)
        .background(Color(.systemGray5))
        .cornerRadius(25)
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoView(user: appUser01, viewModel: ToDoViewModel())
    }
}

struct CreateTodoButton: View {
    var body: some View {
        Text("Create")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 150, height: 40)
            .background(Color.blue.opacity(0.6))
            .clipShape(Capsule())
    }
}

struct CancelTodoButton: View {
    var body: some View {
        Text("Cancel")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 100, height: 40)
            .background(Color.red.opacity(0.6))
            .clipShape(Capsule())
    }
}
