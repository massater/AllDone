//
//  BlackView.swift
//  AllDone
//
//  Created by muttley on 11/11/22.
//

import SwiftUI

struct BlackView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(.black
        .opacity(0.5))
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("Tapped")
        }
    }
}

struct BlackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackView()
    }
}
