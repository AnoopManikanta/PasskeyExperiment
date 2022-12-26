//
//  MainCoordinator.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct MainCoordinator: View {
    @State var screen: Screens = .signUpWithPasswordScreen

    var body: some View {
        switch screen {
        case .signUpWithPasswordScreen:
            return AnyView(SignUpWithPasswordView(delegate: self))
        case .signInWithPasswordScreen:
            return AnyView(SignInWithPasswordView(delegate: self))
        case .signUpWithPassKeyScreen:
            return AnyView(SignUpWithPasskeyView(delegate: self))
        case .signInWithPassKeyScreen:
            return AnyView(SignInWithPasskeyView(delegate: self))
        case let .homeScreen(userData, loggedInUsingPasskey):
            return AnyView(HomeScreenCoordinator(loggedInUsingPasskey: loggedInUsingPasskey, userData: userData))
        }
    }
}

// MARK: - SignIn Delegate

extension MainCoordinator: SignInDelegate {
    func onSignUpButtonTap(isPasskey: Bool) {
        screen = isPasskey ? .signUpWithPassKeyScreen : .signUpWithPasswordScreen
    }
    
    func onSignInUsingPasswordButtonTap(isPasskey: Bool, userData: UserData?) {
        if isPasskey {
            screen = .signInWithPasswordScreen
        } else {
            NSLog("Add functionality here")
        }
    }
    
    func onSignInUsingPasskeyButtonTap(isPasskey: Bool, userData: UserData?) {
        if isPasskey {
            NSLog("Add functionality here")
        } else {
            screen = .signInWithPassKeyScreen
        }
    }
}

// MARK: - SignUp Delegate
extension MainCoordinator: SignUpDelegate {
    func onSignInButtonTap(isPasskey: Bool) {
        screen = isPasskey ? .signInWithPassKeyScreen : .signInWithPasswordScreen
    }
    
    func onSignUpUsingPasswordButtonTap(isPasskey: Bool, userData: UserData?) {
        if isPasskey {
            screen = .signUpWithPasswordScreen
        } else {
            guard let userData = userData else { return }
            screen = .homeScreen(userData, loggedInUsingPasskey: false)
        }
    }
    
    func onSignUpUsingPasskeyButtonTap(isPasskey: Bool, userData: UserData?) {
        if isPasskey {
            NSLog("Add functionality here")
        } else {
            screen = .signUpWithPassKeyScreen
        }
    }
}

enum Screens {
    case signUpWithPasswordScreen
    case signInWithPasswordScreen
    case signUpWithPassKeyScreen
    case signInWithPassKeyScreen
    case homeScreen(_ userData: UserData, loggedInUsingPasskey: Bool)
}

enum States {
    case signedUpUsingPassword
}
