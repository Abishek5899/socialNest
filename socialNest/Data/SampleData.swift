import Foundation

let sampleUsers = [
    User(name: "Kristin Watson", profileImage: "user1"),
    User(name: "Wade Warren", profileImage: "user2"),
    User(name: "Leslie Alexander", profileImage: "user3"),
]

let sampleEvents = [
    Event(
        title: "Summer Music Fest",
        date: Date(),
        location: "Central Park",
        description:
            "Join us for a day of live music and fun in Central Park! Enjoy performances by top artists, food trucks, and more.",
        category: "Music",
        price: "Free",
        organizer: "Events Unlimited",
        imageName: "event1",
        attendees: sampleUsers
    ),
    Event(
        title: "Tech Conference",
        date: Date().addingTimeInterval(86400 * 30),
        location: "Expo Center",
        description:
            "Explore the latest in tech and innovation. Keynotes from leading industry experts.",
        category: "Tech",
        price: "$99",
        organizer: "TechWorld",
        imageName: "event2",
        attendees: sampleUsers
    ),
]
