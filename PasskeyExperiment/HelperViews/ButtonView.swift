//
//  ButtonView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct ButtonView: View {
    var action: (() -> Void)?
    let label: String
    let textColor: Color
    let backgroundColor: Color
    let fontSize: CGFloat
    let fontStyle: Font.Weight
    
    init (
        label: GlobalStrings,
        textColor: Color = .white,
        backgroundColor: Color = .clear,
        fontWeight: Font.Weight = .regular,
        fontSize: CGFloat = 12,
        action: (() -> Void)? = nil
    ) {
        self.label = label.value
        self.action = action
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.fontSize = fontSize
        self.fontStyle = fontWeight
    }
    
    var body: some View {
        Button(action: action ?? {}) {
            Text(label)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: self.fontSize))
                .fontWeight(self.fontStyle)
                .padding(8)
                .foregroundColor(textColor)
        } .cornerRadius(8).buttonStyle(.borderedProminent).tint(backgroundColor)
    }
}

// MARK: - Constant

let primaryColor: Color = Color(red: 0.157, green: 0.584, blue: 0.655)
