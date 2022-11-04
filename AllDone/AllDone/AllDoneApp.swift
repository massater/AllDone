//
//  AllDoneApp.swift
//  AllDone
//
//  Created by muttley on 11/3/22.
//

import SwiftUI
import Firebase

@main

struct AllDoneApp: App {
    
    // Setup Firebase
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            LoginView()
        }
    }
}
