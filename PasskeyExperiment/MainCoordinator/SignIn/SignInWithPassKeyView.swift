//
//  SignInWithPassKeyView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct SignInWithPasskeyView: View {
    // MARK: - Views

    @State var signUpButton: ButtonView = ButtonView(label: .signUp,
                                                     textColor: .black)
    @State var signInWithPasswordButton: ButtonView = ButtonView(label: .signInWithPassword,
                                                                 textColor: primaryColor,
                                                                 backgroundColor: .white,
                                                                 fontWeight: .bold,
                                                                 fontSize: 12)
    @State var signInWithPasskeyButton: ButtonView = ButtonView(label: .signInWithPassKey,
                                                                textColor: .white,
                                                                backgroundColor: primaryColor,
                                                                fontWeight: .bold,
                                                                fontSize: 12)
    
    
    // MARK: - Variables

    @State var email: String = ""
    @State var delegate: SignInDelegate?

    // MARK: - Body
    
    var body: some View {
        return VStack {
            Spacer()
            TitleView(title: .signIn).padding(.bottom, 40)
            TextFieldView(placeholder: .emailPlaceholder, binding: $email).padding(.bottom, 20)
            signInWithPasskeyButton.padding(.bottom, 20).padding(commonPadding)
            Text("Or").padding(.bottom, 20).foregroundColor(.gray)
            signInWithPasswordButton.padding(.bottom, 20).padding(commonPadding)
            OptionView(title: .dontHaveAnAccount, button: signUpButton)
            Spacer()
        }.onAppear {
            guard let delegate = delegate else { return }
            signUpButton.action = { delegate.onSignUpButtonTap(isPasskey: true) }
            signInWithPasskeyButton.action = { delegate.onSignInUsingPasskeyButtonTap(isPasskey: true, userData: nil) }
            signInWithPasswordButton.action = { delegate.onSignInUsingPasswordButtonTap(isPasskey: true, userData: nil) }
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithPasskeyView()
    }
}
