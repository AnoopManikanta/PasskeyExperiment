//
//  GlobalStrings.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import Foundation

enum GlobalStrings {
    case signUp
    case signIn
    case emailPlaceholder
    case passwordPlaceholder
    case signUpWithPassKey
    case signUpWithPassword
    case signInWithPassKey
    case signInWithPassword
    case alreadyHaveAnAccount
    case dontHaveAnAccount
    case myAccount
    case profile
    case addPasskey
    case addPassword
    case signOut
    case close
    case unknownError
    
    
    var value: String {
        switch self {
        case .signUp:
            return "Sign Up"
        case .signIn:
            return "Sign In"
        case .emailPlaceholder:
            return "Enter your email"
        case .passwordPlaceholder:
            return "Enter your password"
        case .signUpWithPassKey:
            return "Sign Up Using PassKey"
        case .signUpWithPassword:
            return "Sign Up Using Password"
        case .signInWithPassKey:
            return "Sign In Using PassKey"
        case .signInWithPassword:
            return "Sign In Using Password"
        case .alreadyHaveAnAccount:
            return "Already have an account?"
        case .dontHaveAnAccount:
            return "Don't have an account?"
        case .myAccount:
            return "My Account"
        case .profile:
            return "Profile"
        case .addPasskey:
            return "Add Passkey"
        case .addPassword:
            return "Add Password"
        case .signOut:
            return "Sign Out"
        case .close:
            return "Close"
        case .unknownError:
            return "Unknown Error"
        }
    }
}
