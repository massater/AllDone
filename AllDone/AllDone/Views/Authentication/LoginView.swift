//
//  LoginView.swift
//  AllDone
//
//  Created by muttley on 11/3/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            VStack {
                LogoView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
