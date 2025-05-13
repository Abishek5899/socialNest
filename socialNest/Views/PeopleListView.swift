//
//  PeopleListView.swift
//  socialNest
//
//  Created by Grown Nomad.
//

import SwiftUI

struct PeopleListView: View {           //Displays a list of people (excluding the current user) for browsing and connecting. Each person can be tapped to view their profile.
    var currentUser: Person     //The currently logged-in user (so we can exclude them from the list)
    @ObservedObject var viewModel: PeopleViewModel      //The view model containing all people in the app

    var body: some View {
        NavigationView {
            List(viewModel.people) { person in      //List of all people except the current user
                if person != currentUser {          //Exclude the current user from the list
                    NavigationLink(destination: ProfileView(person: person)) {
                        HStack {
                            Image(person.imageName)     //Profile image, styled as a circle with a border
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(
                                        Color.gray.opacity(0.3), lineWidth: 1)
                                )
                                .shadow(radius: 2)
                            VStack(alignment: .leading) {
                                Text(person.name).bold()
                                Text(           //Person's name, age, and tags
                                    "\(person.age) • \(person.tags.joined(separator: ", "))"
                                )
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("People Nearby")
        }
    }
}
