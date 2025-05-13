//
//  SignUpView.swift
//  socialNest
//
//  Created by Janhavi Jagtap on 13/5/2025.
//
import SwiftUI

struct SignUpView: View {
    @ObservedObject var peopleViewModel: PeopleViewModel
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var age = ""
    @State private var tags = ""
    @State private var bio = ""
    @State private var imageName = "yourProfile"
    @State private var connectionIntent = ""
    @State private var location = ""
    @State private var contactNumber = ""
    @State private var error = ""
    @State private var success = false

    var body: some View {
        Form {
            Section(header: Text("Basic Info")) {
                TextField("Name", text: $name)
                TextField("Age", text: $age)
                    .keyboardType(.numberPad)
                TextField("Contact Number", text: $contactNumber)
                    .keyboardType(.phonePad)
            }
            Section(header: Text("Bio")) {
                TextEditor(text: $bio).frame(height: 80)
            }
            Section(header: Text("Tags (comma separated)")) {
                TextField("Tags", text: $tags)
            }
            Section(header: Text("Connection Intent")) {
                TextEditor(text: $connectionIntent).frame(height: 60)
            }
            Section(header: Text("Location")) {
                TextField("Location", text: $location)
            }
            if !error.isEmpty {
                Text(error).foregroundColor(.red)
            }
            Button("Sign Up") {
                guard !name.isEmpty, let ageInt = Int(age), !contactNumber.isEmpty else {
                    error = "Please fill in all required fields."
                    return
                }
                // Check for duplicate
                if peopleViewModel.people.contains(where: { $0.name == name && $0.contactNumber == contactNumber }) {
                    error = "User already exists."
                    return
                }
                let newPerson = Person(
                    name: name,
                    age: ageInt,
                    tags: tags.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) },
                    bio: bio.isEmpty ? "No bio yet." : bio,
                    imageName: imageName,
                    connectionIntent: connectionIntent.isEmpty ? "Not specified." : connectionIntent,
                    location: location.isEmpty ? "Unknown" : location,
                    contactNumber: contactNumber
                )
                peopleViewModel.people.append(newPerson)
                success = true
                error = ""
            }
            .buttonStyle(.borderedProminent)
            .alert("Sign Up Successful!", isPresented: $success) {
                Button("OK") { dismiss() }
            }
        }
        .navigationTitle("Sign Up")
    }
}
