//
//  SignUpDelegate.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import Foundation

protocol SignUpDelegate {
    func onSignInButtonTap(isPasskey: Bool)
    func onSignUpUsingPasswordButtonTap(isPasskey: Bool, userData: UserData?)
    func onSignUpUsingPasskeyButtonTap(isPasskey: Bool, userData: UserData?)
}

struct UserData {
    let email: String
    let password: String?
}
