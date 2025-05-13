import Foundation

struct User: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let profileImage: String
}
