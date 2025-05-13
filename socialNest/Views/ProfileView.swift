//
//  ProfileView.swift
//  socialNest
//
//  Created by Grown Nomad.
//

import SwiftUI

struct ProfileView: View {          //Displays a detailed profile view for a given person.
    let person: Person              //The person whose profile is being displayed.

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Profile Image
                Image(person.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 4)
                    .padding(.top, 20)

                // Name and Age
                Text(person.name)
                    .font(.title)
                    .fontWeight(.bold)

                Text("Age: \(person.age)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                // Tags
                HStack {
                    ForEach(person.tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .font(.caption)
                            .padding(6)
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                }

                // Bio
                Text(person.bio)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)

                //Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Looking to connect with")
                        .font(.headline)
                    Text(person.connectionIntent)
                        .font(.subheadline)

                    Spacer()

                    Text("Location")
                        .font(.headline)
                    Text(person.location)
                        .font(.subheadline)

                    Text("Contact")
                        .font(.headline)
                        .padding(.top, 4)
                    Text(person.contactNumber)
                        .font(.subheadline)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("Profile")             // Set the navigation bar title and style
        .navigationBarTitleDisplayMode(.inline)
    }
}
