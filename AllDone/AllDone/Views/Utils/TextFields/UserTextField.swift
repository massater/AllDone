//
//  UserTextField.swift
//  AllDone
//
//  Created by muttley on 11/4/22.
//

import SwiftUI

struct UserTextField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.1)))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct UserTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            UserTextField(text: .constant(""), placeholder: "User")
        }
    }
}
