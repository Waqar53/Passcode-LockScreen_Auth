//
//  PasscodeView.swift
//  Passcode-LockScreen
//
//  Created by Waqar Azim on 28/06/24.
//

import SwiftUI

struct PasscodeView: View {
    @State private var passcode=""
    @Binding var isAuthenticated: Bool
    var body: some View {
        VStack(spacing:48){
         
          
            Text("Enter Passcode")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Please enter your 4-digit pin to securely acess your account.").font(.subheadline).multilineTextAlignment(.center)
        }
        .padding(.top)
        //indicator view
        PasscodeIndicatorView(passcode: $passcode)
        Spacer()
        NumberpadView(passcode: $passcode)
        //numberpad
    
            .onChange(of: passcode, {oldValue,newValue in
                    verifyPasscode()
                    })
}
    
    private func verifyPasscode(){
        guard passcode.count==4 else { return }
        Task {
            try?await Task.sleep(nanoseconds:125_000_000)
            isAuthenticated=passcode=="1111"
            passcode=""
        }
    }
}

#Preview {
    PasscodeView(isAuthenticated: .constant(false))
}
