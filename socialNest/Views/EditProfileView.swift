//
//  EditProfileView.swift
//  socialNest
//
//  Created by Grown Nomad.
//

import SwiftUI

//A view that allows the user to edit their profile information.
//Edits are made to a binding of a `Person` object and reflected in the parent view.

struct EditProfileView: View {  //The user profile to edit, passed as a binding so changes persist outside this view.
    @Binding var user: Person
    @State private var name: String
    @State private var age: String
    @State private var bio: String
    @State private var tags: String
    @State private var connectionIntent: String
    @State private var location: String
    @State private var contactNumber: String

    init(user: Binding<Person>) {  //This copies the user's properties into local state variables for editing.
        _user = user
        _name = State(initialValue: user.wrappedValue.name)
        _age = State(initialValue: "\(user.wrappedValue.age)")
        _bio = State(initialValue: user.wrappedValue.bio)
        _tags = State(
            initialValue: user.wrappedValue.tags.joined(separator: ", "))
        _connectionIntent = State(
            initialValue: user.wrappedValue.connectionIntent)
        _location = State(initialValue: user.wrappedValue.location)
        _contactNumber = State(initialValue: user.wrappedValue.contactNumber)

    }

    var body: some View {
        Form {
            Section(header: Text("Basic Info")) {  //Section for editing name and age
                TextField("Name", text: $name)
                TextField("Age", text: $age)
                    .keyboardType(.numberPad)
            }

            Section(header: Text("Bio")) {  //Section for editing bio
                TextEditor(text: $bio)
                    .frame(height: 100)
            }

            Section(header: Text("Tags(comma separated")) {
                TextField("Tags", text: $tags)
            }

            Section(header: Text("Looking to connect with")) {
                TextEditor(text: $connectionIntent).frame(height: 80)
            }

            Section(header: Text("Location / Timezone")) {
                TextField("Location", text: $location)
            }

            Section(header: Text("Contact Number")) {
                TextField("Contact", text: $contactNumber)
                    .keyboardType(.phonePad)
            }

            Button("Save Changes") {  //Save button: updates the bound user with the new values
                user.name = name
                user.age = Int(age) ?? user.age  //Only update if conversion succeeds
                user.bio = bio
                user.tags = tags.split(separator: ",").map {
                    $0.trimmingCharacters(in: .whitespacesAndNewlines)
                }
                user.connectionIntent = connectionIntent
                user.location = location
                user.contactNumber = contactNumber
            }
        }
        .navigationTitle("Edit Profile")
    }
}
