//
//  SignInDelegate.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

protocol SignInDelegate {
    func onSignUpButtonTap(isPasskey: Bool)
    func onSignInUsingPasskeyButtonTap(isPasskey: Bool, userData: UserData?)
    func onSignInUsingPasswordButtonTap(isPasskey: Bool, userData: UserData?)
}

enum SignInError: Error {
    case incorrectEmail
    case incorrectPassword
    case missingEmailOrPassword
    
    var title: Text {
        switch self {
        case .incorrectEmail:
            return Text("Incorrect Email")
        case .incorrectPassword:
            return Text("Incorrect Password")
        case .missingEmailOrPassword:
            return Text("Missing Email or Password")
        }
    }
    
    var message: Text {
        switch self {
        case .incorrectEmail:
            return Text("You have entered a wrong email or the email isn't registered try signing up")
        case .incorrectPassword:
            return Text("You have entered a wrong password try again")
        case .missingEmailOrPassword:
            return Text("Email or Password is missing please try again")
        }
    }
}
