//
//  HomeScreenCoordinator.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

protocol HomeScreenCoordinatorDelegate {
    func onSignOutButtonTap()
}

struct HomeScreenCoordinator: View {
    let loggedInUsingPasskey: Bool
    let userData: UserData
    @State var delegate: HomeScreenCoordinatorDelegate

    var body: some View {
        TabView {
            Text(GlobalStrings.myAccount.value).tabItem {
                Text(GlobalStrings.myAccount.value)
            }
            ProfileView(email: userData.email, loggedInUsingPasskey: loggedInUsingPasskey, delegate: self).tabItem {
                Text(GlobalStrings.profile.value)
            }
        }
    }
}

extension HomeScreenCoordinator: ProfileViewDelegate {
    func onSignOutButtonTap() {
        delegate.onSignOutButtonTap()
    }
}
