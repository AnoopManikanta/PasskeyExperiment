//
//  ContentView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct SignUpWithPasswordView: View {
    // MARK: - Views

    @State var signInButton: ButtonView = ButtonView(label: .signIn,
                                                     textColor: .black)
    @State var signUpWithPasswordButton: ButtonView = ButtonView(label: .signUpWithPassword,
                                                                 textColor: .white,
                                                                 backgroundColor: primaryColor,
                                                                 fontWeight: .bold,
                                                                 fontSize: 12)
    @State var signUpWithPasskeyButton: ButtonView = ButtonView(label: .signUpWithPassKey,
                                                                textColor: primaryColor,
                                                                backgroundColor: .white,
                                                                fontWeight: .bold,
                                                                fontSize: 12)

    // MARK: - Variables

    @State var email: String = ""
    @State var delegate: SignUpDelegate?
    @State var password: String = ""

    // MARK: - Body

    var body: some View {
        return VStack {
            Spacer()
            TitleView(title: .signUp).padding(.bottom, 40)
            TextFieldView(placeholder: .emailPlaceholder, binding: $email).padding(.bottom, 20)
            SecureInputField(.passwordPlaceholder, $password).padding(.bottom, 20)
            signUpWithPasswordButton.padding(.bottom, 20).padding(commonPadding)
            Text("Or").padding(.bottom, 20).foregroundColor(.gray)
            signUpWithPasskeyButton.padding(.bottom, 10).padding(commonPadding)
            OptionView(title: .alreadyHaveAnAccount, button: signInButton)
            Spacer()
        }.onAppear {
            signInButton.action = { delegate?.onSignInButtonTap(isPasskey: false) }
            signUpWithPasskeyButton.action = { delegate?.onSignUpUsingPasskeyButtonTap(isPasskey: false, userData: nil) }
            signUpWithPasswordButton.action = { delegate?.onSignUpUsingPasswordButtonTap(isPasskey: false, userData: UserData(email: email, password: password)) }
        }
    }
}

struct IsHidden: ViewModifier {
    var hidden: Bool = false

    func body(content: Content) -> some View {
        if hidden {
            content.hidden()
        } else {
            content
        }
    }
}

// MARK: - Constants

let fontSize: CGFloat = 22
let boldFont: Font.Weight = .bold
let commonPadding: EdgeInsets = EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
