//
//  ContentView.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import SwiftUI

struct ContentView: View {
    var currentUser: Person
    @ObservedObject var peopleViewModel: PeopleViewModel

    var body: some View {
        TabView {
            PeopleListView(currentUser: currentUser, viewModel: peopleViewModel)
                .tabItem {
                    Label("Discover", systemImage: "person.3.fill")
                }
            NavigationView {
                YourProfileView(user: currentUser)
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            .tabItem {
                Label("Profile",systemImage: "person.crop.circle")
            }
            EventListView()
            
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
        }
    }
}

