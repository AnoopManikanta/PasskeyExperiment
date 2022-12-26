//
//  SignUpWithPassKeyView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct SignUpWithPasskeyView: View {
    // MARK: - Views
    @State var signInButton: ButtonView = ButtonView(label: .signIn,
                                                     textColor: .black)
    @State var signUpWithPasswordButton: ButtonView = ButtonView(label: .signUpWithPassword,
                                                                 textColor: primaryColor,
                                                                 backgroundColor: .white,
                                                                 fontWeight: .bold,
                                                                 fontSize: 12)
    @State var signInWithPasskeyButton: ButtonView = ButtonView(label: .signUpWithPassKey,
                                                                textColor: .white,
                                                                backgroundColor: primaryColor,
                                                                fontWeight: .bold,
                                                                fontSize: 12)
    // MARK: - Variables

    var delegate: SignUpDelegate? = nil
    @State var email: String = ""

    // MARK: - Body
    
    var body: some View {
        return VStack {
            Spacer()
            TitleView(title: .signUp).padding(.bottom, 40)
            TextFieldView(placeholder: .emailPlaceholder, binding: $email).padding(.bottom, 20)
            signInWithPasskeyButton.padding(.bottom, 20).padding(commonPadding)
            Text("Or").padding(.bottom, 20).foregroundColor(.gray)
            signUpWithPasswordButton.padding(.bottom, 20).padding(commonPadding)
            OptionView(title: .dontHaveAnAccount, button: signInButton)
            Spacer()
        }.onAppear {
            guard let delegate = delegate else { return }
            signInButton.action = { delegate.onSignInButtonTap(isPasskey: true) }
            signInWithPasskeyButton.action = { delegate.onSignUpUsingPasskeyButtonTap(isPasskey: true, userData: nil) }
            signUpWithPasswordButton.action = { delegate.onSignUpUsingPasswordButtonTap(isPasskey: true, userData: nil) }
        }
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        SignUpWithPasskeyView()
    }
}
