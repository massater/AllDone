//
//  DashboardView.swift
//  AllDone
//
//  Created by muttley on 11/4/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    @State var searchText: String = ""
    @ObservedObject var viewModel = ToDoViewModel()
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Spacer()
                    Text("- AllDone -")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                } // end of HStack
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            AuthViewModel.shared.signOut()
                        } label: {
                            Text("Logout")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                    }  // end of HStack
                } // end of Overlay
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                ToDoButtonStackView(viewModel: viewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if viewModel.todosFiltered.isEmpty {
                    AddToDoLogView()
                        .padding(.top)
                }
            } // end of VStack
            
        } // end of ZStack
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
