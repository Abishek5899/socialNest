//
//  ContentView.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PeopleListView(viewModel: PeopleViewModel())
    }
}

#Preview {
    ContentView()
}

