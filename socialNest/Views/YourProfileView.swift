//
//  YourProfileView.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import SwiftUI

struct YourProfileView: View {
    @State private var isEditing = false
    @State var user: Person
    
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
        .navigationTitle("Your Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: EditProfileView(user: $user)) {
                    Image(systemName: "pencil")
                }
            }
        }
    }
}
