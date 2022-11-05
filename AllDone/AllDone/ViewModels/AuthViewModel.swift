//
//  AuthViewModel.swift
//  AllDone
//
//  Created by muttley on 11/4/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?   // Firebase User
    @Published var currentUser: AppUser?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func fetchUser() {
        print("👨🏼‍💻 Fetching User")
        guard let uid = userSession?.uid else { print("❌ Error fetching user"); return}
        
        print("User Session: ", userSession?.uid as Any)
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            if error != nil { print("❌ Error getDocument user"); return }
            print("SnapShot: \(snapshot)")
//            guard let user = try? snapshot?.data(as: AppUser.self) else { print("❌ Error getting AppUse"); return}

            do{
                if let data = snapshot?.data() {
                    let uid = data["uid"] as? String ?? ""
                    let firstName = data["firstName"] as? String ?? ""
                    let lastName = data["lastName"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    print("Data: \(data)")
                    self.currentUser = AppUser(uid: uid, fristName: firstName, lastName: lastName, email: email)
                }else {
                    print("No Snapshot Data: \(snapshot?.data())")
                    self.userSession = nil
                }
            } catch {
                print("❌ Error getting AppUser: ", error);
            }
        }
    }
    
    func login(withEmail email:String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("❌ Error: Login Failed: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { print("❌ Error: No User"); return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email:String, password: String, firstName: String, lastName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            print(firstName, lastName, email, password)
            if let error = error {
                print("❌ Error: Register User Failed: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { print("❌ Error: No User"); return }
            
            let data = [
                "uid": user.uid,
                "firstName": firstName,
                "lastName": lastName,
                "email":email
            ]
            
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                print("🏗 Successfully uploaded data")
                self.userSession = user
                print(self.userSession, "::", user)
                self.fetchUser()
            }
            print("Done")
            
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        print("Reset Password!")
    }
    
}
