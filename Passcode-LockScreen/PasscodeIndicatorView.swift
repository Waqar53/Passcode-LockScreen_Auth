//
//  PasscodeIndicatorView.swift
//  Passcode-LockScreen
//
//  Created by Waqar Azim on 28/06/24.
//

import SwiftUI

struct PasscodeIndicatorView: View {
    @Binding var passcode:String
    var body: some View {
        HStack(spacing:32){
            ForEach(0..<4){ index in
                Circle().frame(width: 20,height: 20)
                    .overlay {
                        Circle()
                            .fill(passcode.count > index ? .primary : Color(.white))
                        .stroke(.black,lineWidth: 1.0)                    }
            }
        }
    }
}

#Preview {
    PasscodeIndicatorView(passcode: .constant(""))
}
