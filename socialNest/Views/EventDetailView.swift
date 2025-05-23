import SwiftUI

struct EventDetailView: View {
    let event: Event
    @ObservedObject var peopleViewModel: PeopleViewModel        // The shared people view model (provides attendee info)

    @State private var showConfirmation = false         // Controls display of the booking confirmation alert
    @State private var showAlreadyBookedAlert = false   // Controls display of the "already booked" alert
    @State private var attendees: [Person]              // The list of people attending the event
    @State private var ticketBooked: Bool               // Whether the current user has booked a ticket for this event

    // Simulated logged-in user
    let currentUser = Person(
        name: "You",
        age: 26,
        tags: ["Developer", "Gamer", "TeaLover"],
        bio:
            "SwiftUI enthusiast building cool apps. Always up for side quests — digital or real.",
        imageName: "yourProfile",
        connectionIntent: "...",
        location: "Melbourne",
        contactNumber: "+61 400 123 456"
    )

    init(event: Event, peopleViewModel: PeopleViewModel) {      // Initializes the view with the event and people model.
        self.event = event
        self.peopleViewModel = peopleViewModel
        let wasBooked = UserDefaults.standard.bool(             // Check if this event was already booked by the user
            forKey: "booked_\(event.id.uuidString)")
        _ticketBooked = State(initialValue: wasBooked)

        let shuffledPeople = peopleViewModel.people.shuffled()
        _attendees = State(initialValue: Array(shuffledPeople.prefix(3)))
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {        // Scrollable area for event details and attendee list
                VStack(alignment: .leading, spacing: 16) {
                    Image("Image")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)

                    Text(event.title).font(.largeTitle).bold()

                    Group {         // Event metadata
                        Text(
                            "Date: \(event.date.formatted(date: .long, time: .shortened))"
                        )
                        Text("Location: \(event.location)")
                        Text("Organized by: \(event.organizer)")
                        Text("Category: \(event.category)")
                        Text("Price: \(event.price)")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)

                    Text(event.description).padding(.top)       // Event description

                    Text("Attendees").font(.title2).bold().padding(.top)

                    ForEach(attendees) { person in          // List of attendees with navigation to their profiles
                        NavigationLink(destination: ProfileView(person: person))
                        {
                            HStack {
                                Image(person.imageName)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                Text(person.name).font(.body)
                                Spacer()
                            }
                        }
                    }

                    Spacer(minLength: 80)  // Avoids last list item being under the button
                }
                .padding()
            }

            Divider()

            HStack(alignment: .bottom) {            // Bottom bar with attendee count and booking button
                VStack(alignment: .leading, spacing: 4) {
                    Text("Attendees")
                        .font(.caption)
                        .foregroundColor(.gray)

                    Text("\(attendees.count)")
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .font(.headline)
                }

                Spacer()

                Button(action: {            // Book Ticket button
                    if attendees.contains(currentUser) {        // If the user is already in the attendee list, show alert
                        showAlreadyBookedAlert = true
                    } else {
                        attendees.append(currentUser)           // Add user to attendees, mark as booked,
                        ticketBooked = true
                        setEventBooked(event.id)
                        showConfirmation = true
                    }
                }) {
                    Text(ticketBooked ? "Ticket Booked" : "Book Ticket")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(ticketBooked ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 4, y: -2)

        }
        .alert("Ticket Booked!", isPresented: $showConfirmation) {      // Booking confirmation alert
            Button("OK") { showConfirmation = false }
        }
        .alert(                                                         // Already booked alert
            "You already booked the ticket!",
            isPresented: $showAlreadyBookedAlert
        ) {
            Button("OK") { showAlreadyBookedAlert = false }
        }
    }
    func setEventBooked(_ id: UUID) {           // Persists that the event was booked by the user
        UserDefaults.standard.set(true, forKey: "booked_\(id.uuidString)")
    }

}
