//
//  DashboardView.swift
//  AllDone
//
//  Created by muttley on 11/4/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    
    
    var body: some View {
        VStack{
            Text("DashboardView")
            Button {
                AuthViewModel.shared.signOut()
            } label: {
                Text("Log Out")
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
