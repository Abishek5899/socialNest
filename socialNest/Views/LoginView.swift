//
//  LoginView.swift
//  socialNest
//
//  Created by Janhavi Jagtap.
//

import SwiftUI

//The main login screen for the SocialNest app. Allows users to log in with their name and contact number, or navigate to the sign-up screen.
struct LoginView: View {
    @ObservedObject var peopleViewModel: PeopleViewModel
    @State private var name = ""
    @State private var contactNumber = ""
    @State private var error = ""
    @State private var loggedInUser: Person? = nil      // The user who successfully logs in.
    @State private var showMainView = false     // Controls navigation to the main app view after login.
    @State private var showSignup = false       // Controls navigation to the sign-up screen.

    var body: some View {

        NavigationStack {
            ZStack {
                Color(red: 0.363, green: 0.373, blue: 0.303).ignoresSafeArea()      //background color
                ScrollView {
                    VStack {
                        Image("socialNestLogo")     //App logo at the top
                            .resizable()
                            .scaledToFit()
                            .padding(.vertical, 50)
                        LoginForm       //The login form
                    }
                }
            }

            .navigationDestination(isPresented: $showMainView) {            // Navigation to the main app view after successful login
                if let user = loggedInUser {
                    ContentView(
                        currentUser: user, peopleViewModel: peopleViewModel)
                }
            }
            .navigationDestination(isPresented: $showSignup) {          // Navigation to the sign-up screen
                SignUpView(peopleViewModel: peopleViewModel)
            }
            .navigationTitle("Login")
        }
    }

    private var LoginForm: some View {          // The login form UI: name, contact, error, and action buttons
        VStack {
            TextField("Name", text: $name)
            TextField("Contact Number", text: $contactNumber)
                .keyboardType(.phonePad)
                .padding(.vertical, 10)
            if !error.isEmpty {             // Error message if login fails
                Text(error).foregroundColor(.red)
            }
            Button("Login") {
                if let user = peopleViewModel.people.first(where: {             // Attempt to find a matching user in the people view model
                    $0.name == name && $0.contactNumber == contactNumber
                }) {
                    loggedInUser = user
                    error = ""
                    showMainView = true         // Trigger navigation to main view
                } else {
                    error = "User not found or incorrect credentials."
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 20)
            Button("Sign Up") {
                showSignup = true               // Trigger navigation to sign-up view
            }
            .buttonStyle(.bordered)
        }
        .padding(.all, 20)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .padding(.all, 8)
    }
}

#Preview {
    LoginView(peopleViewModel: PeopleViewModel())
}
