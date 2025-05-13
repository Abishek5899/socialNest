//
//  ContentView.swift
//  socialNest
//
//  Created by Grown Nomad.
//

import SwiftUI

struct ContentView: View {  // The main content view shown after login.
    var currentUser: Person  // Displays a tab bar with Discover, Profile, and Events sections.
    @ObservedObject var peopleViewModel: PeopleViewModel  // The shared people view model

    var body: some View {
        TabView {  // Tab bar for main app navigation
            PeopleListView(currentUser: currentUser, viewModel: peopleViewModel)
                .tabItem {
                    Label("Discover", systemImage: "person.3.fill")
                }
            NavigationView {  // Profile tab: shows the current user's profile
                YourProfileView(user: currentUser)
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            EventListView()  // Events tab: shows a list of events

                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
        }
    }
}
