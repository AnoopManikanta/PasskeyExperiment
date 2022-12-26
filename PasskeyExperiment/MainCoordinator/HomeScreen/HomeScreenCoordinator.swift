//
//  HomeScreenCoordinator.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

struct HomeScreenCoordinator: View {
    let loggedInUsingPasskey: Bool
    let userData: UserData
    
    init(loggedInUsingPasskey: Bool, userData: UserData) {
        self.loggedInUsingPasskey = loggedInUsingPasskey
        self.userData = userData
    }

    var body: some View {
        TabView {
            Text(GlobalStrings.myAccount.value).tabItem {
                Text(GlobalStrings.myAccount.value)
            }
            ProfileView(email: userData.email, loggedInUsingPasskey: loggedInUsingPasskey).tabItem {
                Text(GlobalStrings.profile.value)
            }
        }
    }
}
