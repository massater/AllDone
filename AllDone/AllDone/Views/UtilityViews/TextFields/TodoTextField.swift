//
//  TodoTextField.swift
//  AllDone
//
//  Created by muttley on 11/11/22.
//

import SwiftUI

struct TodoTextField: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "checkmark.square", foregroundColor: .gray)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

struct TodoTextField_Previews: PreviewProvider {
    static var previews: some View {
        TodoTextField(text: .constant(""), placeholder: "Title")
    }
}
