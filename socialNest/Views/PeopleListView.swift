//
//  PeopleListView.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import SwiftUI

struct PeopleListView: View {
    var currentUser: Person
    @ObservedObject var viewModel: PeopleViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.people) { person in
                if(person != currentUser){
                    NavigationLink(destination: ProfileView(person: person)) {
                        HStack {
                            Image(person.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
                                .shadow(radius: 2)
                            VStack(alignment: .leading) {
                                Text(person.name).bold()
                                Text("\(person.age) • \(person.tags.joined(separator: ", "))")
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
