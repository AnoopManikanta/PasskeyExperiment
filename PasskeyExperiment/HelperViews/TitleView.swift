//
//  TitleView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct TitleView: View {
    var title: String

    init(title: GlobalStrings) {
        self.title = title.value
    }

    var body: some View {
        Text(title)
            .padding([.leading, .top], 20)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(boldFont)
            .font(.system(size: fontSize))
    }
}
