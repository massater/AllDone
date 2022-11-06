//
//  AddToDoLogView.swift
//  AllDone
//
//  Created by muttley on 11/6/22.
//

import SwiftUI

struct AddToDoLogView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .background(colorScheme == .dark ? .clear : .black)
                .cornerRadius(80)
            
            Text("Add Your First ToDo")
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.system(size: 25))
                .fontWeight(.semibold)
        }
    }
}

struct AddToDoLogView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoLogView()
    }
}
