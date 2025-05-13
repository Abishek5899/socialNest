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
        
        NavigationStack {
            ZStack {
                Color(red: 0.363, green: 0.373, blue: 0.303).ignoresSafeArea()
                ScrollView {
                    VStack{
                        Image("socialNestLogo")
                            .resizable()
                            .scaledToFit()
                            .padding(.vertical, 50)
                        LoginForm
                    }
                }
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
    
    
    private var LoginForm: some View{
        VStack{
            TextField("Name", text: $name)
            TextField("Contact Number", text: $contactNumber)
                .keyboardType(.phonePad)
                .padding(.vertical, 10)
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
            .padding(.top, 20)
            Button("Sign Up") {
                showSignup = true
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

