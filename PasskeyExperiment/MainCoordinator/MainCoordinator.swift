//
//  MainCoordinator.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

enum Screens {
    case signUpWithPasswordScreen
    case signInWithPasswordScreen
    case signUpWithPassKeyScreen
    case signInWithPassKeyScreen
    case homeScreen(_ userData: UserData, loggedInUsingPassKey: Bool)
}

enum ErrorState {
    case signUpError(SignUpError)
    case signInError(SignInError)
}

struct MainCoordinator: View {
    // MARK: - Vriables

    @State var screen: Screens = .signUpWithPasswordScreen
    @State var currentView: AnyView?
    @State var isAlertPresented: Bool = false
    @State var error: ErrorState?
    @State var isPasskey: Bool = false

    // MARK: - Body

    var body: some View {
        ZStack {
            switch screen {
            case .signUpWithPasswordScreen:
                AnyView(SignUpWithPasswordView(delegate: self).alert(isPresented: $isAlertPresented,
                                                                     content: { handle(error: error) }))
            case .signInWithPasswordScreen:
                AnyView(SignInWithPasswordView(delegate: self).alert(isPresented: $isAlertPresented,
                                                                            content: { handle(error: error) }))
            case .signUpWithPassKeyScreen:
                AnyView(SignUpWithPasskeyView(delegate: self).alert(isPresented: $isAlertPresented,
                                                                           content: { handle(error: error) }))
            case .signInWithPassKeyScreen:
                AnyView(SignInWithPasskeyView(delegate: self).alert(isPresented: $isAlertPresented,
                                                                           content: { handle(error: error) }))
            case let .homeScreen(userData, loggedInUsingPassKey):
                AnyView(HomeScreenCoordinator(loggedInUsingPasskey: loggedInUsingPassKey,
                                                     userData: userData,
                                              delegate: self)
                                             .transition(AnyTransition
                                                .scale
                                                .animation(.easeInOut(duration:0.2))
                                                .combined(with: .opacity))
                                             .alert(isPresented: $isAlertPresented,
                                                    content: { handle(error: error) }))
            }
        }
    }

    // MARK: - Handle Error

    func handle(error: ErrorState?) -> Alert {
        guard let error = error else { return Alert(title: Text(GlobalStrings.unknownError.value)) }
        switch error {

        // MARK: Sign Up Error

        case .signUpError(let signUpError):
            return Alert(title: signUpError.title,
                         message: signUpError.message,
                         dismissButton: Alert.Button.cancel(Text(GlobalStrings.close.value),
                                                            action: {isAlertPresented = false}))

        // MARK: Sign In Error

        case .signInError(let signInError):
            switch signInError {
            case .incorrectEmail:
                return Alert(title: signInError.title,
                             message: signInError.message,
                             primaryButton: Alert.Button.cancel(Text(GlobalStrings.close.value),
                                                                action: {isAlertPresented = false}),
                             secondaryButton: Alert.Button.destructive(Text(GlobalStrings.signUp.value),
                                                                       action: switchToSignUpScreen))
            case .incorrectPassword, .missingEmailOrPassword:
                return Alert(title: signInError.title,
                             message: signInError.message,
                             dismissButton: Alert.Button.cancel(Text(GlobalStrings.close.value),
                                                                action: {isAlertPresented = false}))
            }
        }
    }

    func switchToSignUpScreen() {
        isAlertPresented = false
        screen = isPasskey ? .signUpWithPassKeyScreen : .signUpWithPasswordScreen
    }
}

// MARK: - SignIn Delegate

extension MainCoordinator: SignInDelegate {
    func onSignUpButtonTap(isPasskey: Bool) {
        self.isPasskey = isPasskey
        screen = isPasskey ? .signUpWithPassKeyScreen : .signUpWithPasswordScreen
    }
    
    func onSignInUsingPasswordButtonTap(isPasskey: Bool, userData: UserData?) {
        self.isPasskey = isPasskey
        if isPasskey {
            screen = .signInWithPasswordScreen
        } else {
            guard let userData = userData, !userData.email.isEmpty, let password = userData.password, !password.isEmpty else {
                error = .signInError(SignInError.missingEmailOrPassword)
                isAlertPresented = true
                return
            }
            guard userData.email == email else {
                error = .signInError(SignInError.incorrectEmail)
                isAlertPresented = true
                return
            }
            guard password == userPassword else {
                error = .signInError(SignInError.incorrectPassword)
                isAlertPresented = true
                return
            }
            screen = .homeScreen(userData, loggedInUsingPassKey: false)
        }
    }
    
    func onSignInUsingPasskeyButtonTap(isPasskey: Bool, userData: UserData?) {
        self.isPasskey = isPasskey
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
        self.isPasskey = isPasskey
        if isPasskey {
            screen = .signUpWithPasswordScreen
        } else {
            guard let userData = userData, !userData.email.isEmpty, let password = userData.password, !password.isEmpty else {
                error = .signUpError(SignUpError.missingEmailOrPassword)
                isAlertPresented = true
                return
            }
            guard userData.email == email else {
                error = .signUpError(SignUpError.incorrectEmail)
                isAlertPresented = true
                return
            }
            guard password == userPassword else {
                error = .signUpError(SignUpError.incorrectPassword)
                isAlertPresented = true
                return
            }
            screen = .homeScreen(userData, loggedInUsingPassKey: false)
        }
    }

    func onSignUpUsingPasskeyButtonTap(isPasskey: Bool, userData: UserData?) {
        self.isPasskey = isPasskey
        if isPasskey {
            NSLog("Add functionality here")
        } else {
            screen = .signUpWithPassKeyScreen
        }
    }
}

// MARK: - HomeScreen Coordinator Delegate

extension MainCoordinator: HomeScreenCoordinatorDelegate {
    func onSignOutButtonTap() {
            screen = .signUpWithPasswordScreen
    }
}

// MARK: - Constants

let email = "xyz@gmail.com"
let userPassword = "5555"
