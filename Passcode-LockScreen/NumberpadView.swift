//
//  NumberpadView.swift
//  Passcode-LockScreen
//
//  Created by Waqar Azim on 28/06/24.
//

import SwiftUI

struct NumberpadView: View {
    @Binding var passcode:String
    private let columns: [GridItem] = [
        .init(),
        .init(),
        .init()
        
        
    ]
    var body: some View {
        LazyVGrid(columns:columns){
            ForEach(1...9,id: \.self){index in
                Button {
                    addValue(index)
                } label: {
                    Text("\(index)")
                        .font(.title).frame(maxWidth: .infinity).padding(.vertical,16).contentShape(Rectangle())
                }
            }
            Button {
                removeValue()
            } label: {
                Image(systemName: "delete.backward")
                    .font(.title).frame(maxWidth: .infinity).padding(.vertical,16).contentShape(Rectangle())
            }
            Button{
                addValue(0)
            }label: {
                Text("0")
                    .font(.title).frame(maxWidth: .infinity).padding(.vertical,16).contentShape(Rectangle())
            }
            
        }.foregroundStyle(.primary)
    }
    
    private func addValue(_ value:Int){
        if passcode.count<4{
            passcode+="\(value)"
        }
    }
    private func removeValue(){
        if !passcode.isEmpty{
            passcode.removeLast()
        }
    }
}
#Preview {
    NumberpadView(passcode:.constant(""))
}
