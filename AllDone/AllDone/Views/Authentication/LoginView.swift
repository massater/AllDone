//
//  LoginView.swift
//  AllDone
//
//  Created by muttley on 11/3/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                
                VStack {
                    LogoView()
                        .padding(.bottom, 25)
                    
                    VStack(spacing: 20) {
                        EmailTextField(text: $email)
                        PasswordSecureField(text: $password, placeholder: "Password")
                    }  // end of VStack
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        Button {
                            // Forgot Password Action
                        } label: {
                            Text("Forgot Password")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                    } // end of Hstack
                    
                    Button {
                        // Sign In Action
                        viewModel.login(withEmail: email, password: password)
                    } label: {
                        AuthenticateButtonView(text: "Sign In")
                            .padding()
                    }

                    Spacer()

                    NavigationLink(
                        destination: SignUpView()
                            .navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't hava an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                        })
                    .padding(.bottom, 16)
                    
                } // end of VStack
                .padding(.top, 40)
            }
        } // end of ZStack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
