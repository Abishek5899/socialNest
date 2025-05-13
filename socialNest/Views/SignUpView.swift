//
//  SignUpView.swift
//  socialNest
//
//  Created by Janhavi Jagtap.
//
import SwiftUI

struct SignUpView: View {       //This view allows users to sign up by entering their profile details. On successful sign up, the new user is added to the PeopleViewModel.
    @ObservedObject var peopleViewModel: PeopleViewModel        //The shared people view model (where new users are added)
    @Environment(\.dismiss) var dismiss             //Used to dismiss the sign up view after successful registration

    @State private var name = ""
    @State private var age = ""
    @State private var tags = ""
    @State private var bio = ""
    @State private var imageName = "yourProfile"
    @State private var connectionIntent = ""
    @State private var location = ""
    @State private var contactNumber = ""
    @State private var error = ""
    @State private var success = false      // Controls the display of the success alert

    var body: some View {
        Form {
            Section(header: Text("Basic Info")) {       // Section for basic info: name, age, contact number
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
            if !error.isEmpty {                     //Show error message if any validation fails
                Text(error).foregroundColor(.red)
            }
            Button("Sign Up") {
                guard !name.isEmpty, let ageInt = Int(age),
                    !contactNumber.isEmpty
                else {
                    error = "Please fill in all required fields."
                    return
                }
                
                if peopleViewModel.people.contains(where: {         //Check for duplicate
                    $0.name == name && $0.contactNumber == contactNumber
                }) {
                    error = "User already exists."
                    return
                }
                let newPerson = Person(         //Create a new Person from the entered details
                    name: name,
                    age: ageInt,
                    tags: tags.split(separator: ",").map {
                        $0.trimmingCharacters(in: .whitespaces)
                    },
                    bio: bio.isEmpty ? "No bio yet." : bio,
                    imageName: imageName,
                    connectionIntent: connectionIntent.isEmpty
                        ? "Not specified." : connectionIntent,
                    location: location.isEmpty ? "Unknown" : location,
                    contactNumber: contactNumber
                )
                peopleViewModel.people.append(newPerson)            //Add the new user to the people view model
                success = true              //Show success alert
                error = ""
            }
            .buttonStyle(.borderedProminent)
            .alert("Sign Up Successful!", isPresented: $success) {      //Success alert, dismisses the view when OK is tapped
                Button("OK") { dismiss() }
            }
        }
        .navigationTitle("Sign Up")
    }
}
