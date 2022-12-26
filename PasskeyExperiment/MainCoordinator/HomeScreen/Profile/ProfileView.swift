//
//  ProfileView.swift
//  PasskeyExperiment
//
//  Created by Anoop Subramani on 26/12/22.
//

import SwiftUI

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

struct ProfileView: View {
    let email: String
    let loggedInUsingPasskey: Bool

    var body: some View {
        NavigationView {
            backgroundColor.ignoresSafeArea().overlay {
                VStack{
                    HStack {
                        Text(email).padding(commonPadding)
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
                    
                    List(TableViewOptions.getAccountOptions(loggedInUsingPasskey)){ option in
                        NavigationLink(option.name, destination: Text("yay"))
                    }
                    Spacer()
                    HStack {
                        Text(GlobalStrings.signOut.value).padding(commonPadding)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .foregroundColor(.red)
                        Image(systemName: "rectangle.portrait.and.arrow.right").padding(.trailing, 20).foregroundColor(.red)
                    }.frame(maxWidth: .infinity, maxHeight: 66)
                        .background(.white)
                        .cornerRadius(16)
                        .padding([.top, .bottom], 16)
                        .padding(commonPadding)
                }
            }
        }
    }
}

struct MyAccountView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileView(email: "anoop.manikanta.21@gmail.com", loggedInUsingPasskey: true)
    }
}

// MARK: - Constant

let backgroundColor: Color = Color(red: 0.965, green: 0.965, blue: 0.984)
