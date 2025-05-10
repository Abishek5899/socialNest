//
//  Person.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let tags: [String]
    let bio: String
    let imageName: String
}
