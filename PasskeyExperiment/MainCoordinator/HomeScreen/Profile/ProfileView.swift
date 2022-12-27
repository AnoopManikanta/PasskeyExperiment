//
//  ProfileView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

protocol ProfileViewDelegate {
    func onSignOutButtonTap()
}

struct ProfileView: View {
    let email: String
    let loggedInUsingPasskey: Bool
    @State var delegate: ProfileViewDelegate

    var body: some View {
        NavigationView {
            backgroundColor.ignoresSafeArea().overlay {
                VStack{
                    UserDataView(email: email)
                    List(TableViewOptions.getAccountOptions(loggedInUsingPasskey)){ option in
                        NavigationLink(option.name, destination: Text("TODO: Add functionality here"))
                    }
                    Spacer()
                    SignOutView().onTapGesture {
                        delegate.onSignOutButtonTap()
                    }
                }
            }
        }
    }
}

struct UserDataView: View {
    @State var email: String
    
    var body: some View {
        HStack {
            Image("wwdc")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 50, maxHeight: 50)
                .clipShape(Circle())
                .padding(.leading, 20)
            Text(email).padding(.leading, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .truncationMode(.middle)
        }
        .frame(maxWidth: .infinity, maxHeight: 66)
        .background(.white)
        .cornerRadius(16)
        .padding([.top, .bottom], 16)
        .padding(commonPadding)
    }
}

struct SignOutView: View {
    var body: some View {
        HStack {
            Text(GlobalStrings.signOut.value).padding(commonPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .truncationMode(.middle)
                .foregroundColor(.red)
            Image(systemName: "rectangle.portrait.and.arrow.right").padding(.trailing, 20).foregroundColor(.red)
        }.frame(maxWidth: .infinity, maxHeight: 48)
            .background(.white)
            .cornerRadius(16)
            .padding([.top, .bottom], 16)
            .padding(commonPadding)
    }
}

struct TableViewOptions: Identifiable {
    var id: Int
    let name: String
    
    static func getAccountOptions(_ loggedInUsingPasskey: Bool) -> [TableViewOptions] {
        var list = [TableViewOptions]()
        if loggedInUsingPasskey {
            list.append(TableViewOptions(id: 1, name: GlobalStrings.addPassword.value))
        } else {
            list.append(TableViewOptions(id: 1, name: GlobalStrings.addPasskey.value))
        }
        return list
    }
}

// MARK: - Constant

let backgroundColor: Color = Color(red: 0.965, green: 0.965, blue: 0.984)
