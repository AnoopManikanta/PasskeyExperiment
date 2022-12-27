//
//  TextFieldView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct TextFieldView: View {
    var placeholder: String
    @Binding var textInput: String
    
    init(placeholder: GlobalStrings, binding: Binding<String>) {
        self.placeholder = placeholder.value
        _textInput = binding
    }
    
    var body: some View {
        TextField(placeholder,
                  text: $textInput)
        .textFieldStyle(.roundedBorder)
        .padding(commonPadding)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
    }
}
