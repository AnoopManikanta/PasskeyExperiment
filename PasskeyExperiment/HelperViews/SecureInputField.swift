//
//  SecureInputField.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct SecureInputField: View {
    @Binding var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: GlobalStrings, _ binding: Binding<String>) {
        self.title = title.value
        _text = binding
    }
    
    var body: some View {
        return ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32).padding(.leading, 8).padding([.top, .bottom], 8)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray).padding(.trailing, 16)
            }
        }.border(Color(red: 0.82, green: 0.82, blue: 0.839, opacity: 0.5)).cornerRadius(4).padding(commonPadding)
    }
}
