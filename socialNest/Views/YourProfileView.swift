//
//  YourProfileView.swift
//  socialNest
//
//  Created by Grown Nomad.
//

import SwiftUI

struct YourProfileView: View {          //Displays the current user's profile with an option to edit. Shows profile image, name, age, tags, bio, connection intent, location, Provides a navigation link to edit the profile.
    @State private var isEditing = false
    @State var user: Person             //The user's profile data

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(user.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 4)
                    .padding(.top, 20)

                Text(user.name)
                    .font(.title)
                    .fontWeight(.bold)

                Text("Age: \(user.age)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack {
                    ForEach(user.tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .font(.caption)
                            .padding(6)
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                }

                Text(user.bio)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                //Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Looking to connect with")
                        .font(.headline)
                    Text(user.connectionIntent)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    //Divider()

                    Text("Location")
                        .font(.headline)
                    Text(user.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("Contact")
                        .font(.headline)
                        .padding(.top, 4)
                    Text(user.contactNumber)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("Your Profile")            //Navigation bar title and style
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {          //Edit button in the navigation bar, navigates to EditProfileView
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: EditProfileView(user: $user)) {
                    Image(systemName: "pencil")
                }
            }
        }
    }
}
