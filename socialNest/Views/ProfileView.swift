//
//  ProfileView.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import SwiftUI

import SwiftUI

struct ProfileView: View {
    let person: Person
    
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
                    //.foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Location")
                        .font(.headline)
                    Text(person.location)
                        .font(.subheadline)
                    //.foregroundColor(.gray)
                    
                    Text("Contact")
                        .font(.headline)
                        .padding(.top, 4)
                    Text(person.contactNumber)
                        .font(.subheadline)
                    //.foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}
