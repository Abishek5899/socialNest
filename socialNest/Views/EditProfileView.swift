//
//  EditProfileView.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var user: Person
    @State private var name: String
    @State private var age: String
    @State private var bio: String
    @State private var tags: String

    init(user: Binding<Person>) {
        _user = user
        _name = State(initialValue: user.wrappedValue.name)
        _age = State(initialValue: "\(user.wrappedValue.age)")
        _bio = State(initialValue: user.wrappedValue.bio)
        _tags = State(initialValue: user.wrappedValue.tags.joined(separator: ", "))
    }

    var body: some View {
        Form {
            Section(header: Text("Basic Info")) {
                TextField("Name", text: $name)
                TextField("Age", text: $age)
                    .keyboardType(.numberPad)
            }

            Section(header: Text("Bio")) {
                TextEditor(text: $bio)
                    .frame(height: 100)
            }
            
            Section(header: Text("Tags(comma separated")) {
                TextField("Tags", text:$tags)
            }


            Button("Save Changes") {
                user.name = name
                user.age = Int(age) ?? user.age
                user.bio = bio
                user.tags = tags.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            }
        }
        .navigationTitle("Edit Profile")
    }
}
