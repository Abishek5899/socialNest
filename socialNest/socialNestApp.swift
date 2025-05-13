//
//  socialNestApp.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import SwiftUI

@main
struct socialNestApp: App {
    @StateObject var peopleViewModel = PeopleViewModel()

    var body: some Scene {
        WindowGroup {
            LoginView(peopleViewModel: peopleViewModel)  //going to the first view of the app
        }
    }
}
