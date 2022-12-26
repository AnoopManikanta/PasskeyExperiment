//
//  OptionView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct OptionView: View {
    let button: ButtonView
    let title: String
    
    init(title: GlobalStrings, button: ButtonView) {
        self.title = title.value
        self.button = button
    }
    
    var body: some View {
        HStack {
            Text(title)
                .frame(maxWidth: .infinity)
                .fixedSize(horizontal: true, vertical: false)
                .padding(.leading, 90)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            button
                .fixedSize(horizontal: false, vertical: false)
                .padding(.leading, -100)
        }
    }
}
