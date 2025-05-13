//
//  Person.swift
//  socialNest
//
//  Created by Grown Nomad.
//

import Foundation

struct Person: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var age: Int
    var tags: [String]
    var bio: String
    var imageName: String
    var connectionIntent: String
    var location: String
    var contactNumber: String
}
