import Foundation

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let location: String
    let description: String
    let category: String
    let price: String
    let organizer: String
    let imageName: String
    let attendees: [User]
}
