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
    @State private var connectionIntent: String
    @State private var location: String
    @State private var contactNumber: String
    
    
    init(user: Binding<Person>) {
        _user = user
        _name = State(initialValue: user.wrappedValue.name)
        _age = State(initialValue: "\(user.wrappedValue.age)")
        _bio = State(initialValue: user.wrappedValue.bio)
        _tags = State(initialValue: user.wrappedValue.tags.joined(separator: ", "))
        _connectionIntent = State(initialValue: user.wrappedValue.connectionIntent)
        _location = State(initialValue: user.wrappedValue.location)
        _contactNumber = State(initialValue: user.wrappedValue.contactNumber)
        
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
            
            
            Button("Save Changes") {
                user.name = name
                user.age = Int(age) ?? user.age
                user.bio = bio
                user.tags = tags.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                user.connectionIntent = connectionIntent
                user.location = location
                user.contactNumber = contactNumber
            }
        }
        .navigationTitle("Edit Profile")
    }
}
