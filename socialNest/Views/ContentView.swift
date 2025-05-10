//
//  ContentView.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import SwiftUI

struct ContentView: View {
    let currentUser = Person(
        name: "You",
        age: 26,
        tags: ["Developer", "Gamer", "TeaLover"],
        bio: "SwiftUI enthusiast building cool apps. Always up for side quests — digital or real.",
        imageName: "yourProfile",
        connectionIntent: "People who love hackathons, creative projects, and matcha meetups.",
        location: "New York City, USA (GMT-4)",
        contactNumber: "+1 (917) 555-0144"
    )
    var body: some View {
        TabView{
            PeopleListView(viewModel: PeopleViewModel())
                .tabItem{
                    Label("Discover",systemImage: "person.3.fill")
                }
            NavigationView {
                YourProfileView(user: currentUser)
            }
            .tabItem {
                Label("Profile",systemImage: "person.crop.circle")
            }
        }
    }
}

#Preview {
    ContentView()
}

