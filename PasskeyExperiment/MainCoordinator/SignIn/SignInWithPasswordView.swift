//
//  ContentView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct SignInWithPasswordView: View {
    // MARK: - Views

    @State var signInButton: ButtonView = ButtonView(label: .signUp,
                                                     textColor: .black)
    @State var signInWithPasswordButton: ButtonView = ButtonView(label: .signInWithPassword,
                                                                 textColor: .white,
                                                                 backgroundColor: primaryColor,
                                                                 fontWeight: .bold,
                                                                 fontSize: 12)
    @State var signInWithPasskeyButton: ButtonView = ButtonView(label: .signInWithPassKey,
                                                                textColor: primaryColor,
                                                                backgroundColor: .white,
                                                                fontWeight: .bold,
                                                                fontSize: 12)
    
    
    // MARK: - Variables

    @State var email: String = ""
    @State var password: String = ""
    @State var delegate: SignInDelegate?
    
    // MARK: - Body
    
    var body: some View {
        return VStack {
            Spacer()
            TitleView(title: .signIn)
                .padding(.bottom, 40)
            TextFieldView(placeholder: .emailPlaceholder, binding: $email).padding(.bottom, 20)
            SecureInputField(.passwordPlaceholder, $password).padding(.bottom, 20)
            signInWithPasswordButton
                .padding(.bottom, 20).padding(commonPadding)
            Text("Or").padding(.bottom, 20).foregroundColor(.gray)
            signInWithPasskeyButton
                .padding(.bottom, 20).padding(commonPadding)
            OptionView(title: .alreadyHaveAnAccount, button: signInButton)
            Spacer()
        }.onAppear {
            signInButton.action = { delegate?.onSignUpButtonTap(isPasskey: false) }
            signInWithPasskeyButton.action = { delegate?.onSignInUsingPasskeyButtonTap(isPasskey: false, userData: UserData(email: email, password: nil)) }
            signInWithPasswordButton.action = { delegate?.onSignInUsingPasswordButtonTap(isPasskey: false, userData: UserData(email: email, password: password)) }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithPasswordView()
    }
}
