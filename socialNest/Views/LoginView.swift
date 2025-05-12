//
//  LoginView.swift
//  socialNest
//
//  Created by Janhavi Jagtap on 13/5/2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var peopleViewModel: PeopleViewModel
    @State private var name = ""
    @State private var contactNumber = ""
    @State private var error = ""
    @State private var loggedInUser: Person? = nil
    @State private var showMainView = false
    @State private var showSignup = false

    var body: some View {
        VStack{
            Text("Welcome to SocialNest!").font(.title).padding(.vertical)
            NavigationStack {
                Form {
                    TextField("Name", text: $name)
                    TextField("Contact Number", text: $contactNumber)
                        .keyboardType(.phonePad)
                    if !error.isEmpty {
                        Text(error).foregroundColor(.red)
                    }
                    Button("Login") {
                        if let user = peopleViewModel.people.first(where: { $0.name == name && $0.contactNumber == contactNumber }) {
                            loggedInUser = user
                            error = ""
                            showMainView = true
                        } else {
                            error = "User not found or incorrect credentials."
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    Button("Sign Up") {
                        showSignup = true
                    }
                    .buttonStyle(.bordered)
                }
                .navigationDestination(isPresented: $showMainView) {
                    if let user = loggedInUser {
                        ContentView(currentUser: user, peopleViewModel: peopleViewModel)
                    }
                }
                .navigationDestination(isPresented: $showSignup) {
                    SignUpView(peopleViewModel: peopleViewModel)
                }
                .navigationTitle("Login")
            }
        }
    }
}

#Preview {
    LoginView(peopleViewModel: PeopleViewModel())
}

