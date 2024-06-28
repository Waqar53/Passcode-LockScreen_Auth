//
//  ContentView.swift
//  Passcode-LockScreen
//
//  Created by Waqar Azim on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack {
            if isAuthenticated{
                VStack{
                    Text("You're in!")
                    Button("Logout"){
                        isAuthenticated=false
                    }
                }
            }else{
                PasscodeView(isAuthenticated: $isAuthenticated)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
