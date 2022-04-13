//
//  CustomInputView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/05.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText : String
    
    var action : () -> ()
    
    var body: some View {
        VStack {
            // divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom,8)
            // hstack with send btn and text
            HStack {
                TextField("Comment...",text:$inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight:30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom,8)
            .padding(.horizontal)
        }
        
    }
}
