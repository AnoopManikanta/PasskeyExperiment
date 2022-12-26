//
//  SignInDelegate.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import Foundation

protocol SignInDelegate {
    func onSignUpButtonTap(isPasskey: Bool)
    func onSignInUsingPasskeyButtonTap(isPasskey: Bool, userData: UserData?)
    func onSignInUsingPasswordButtonTap(isPasskey: Bool, userData: UserData?)
}
