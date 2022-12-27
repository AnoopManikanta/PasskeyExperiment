//
//  SignUpDelegate.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

protocol SignUpDelegate {
    func onSignInButtonTap(isPasskey: Bool)
    func onSignUpUsingPasswordButtonTap(isPasskey: Bool, userData: UserData?)
    func onSignUpUsingPasskeyButtonTap(isPasskey: Bool, userData: UserData?)
}

enum SignUpError: Error {
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
            return Text("You have entered a wrong email please try again")
        case .incorrectPassword:
            return Text("You have entered a wrong password please try again")
        case .missingEmailOrPassword:
            return Text("Email or Password is missing please try again")
        }
    }
}


struct UserData {
    let email: String
    let password: String?
}
