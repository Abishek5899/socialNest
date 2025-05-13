import SwiftUI

struct EventListView: View {        //Displays a searchable list of events. Users can tap an event to view its details.
    @State private var searchText = ""

    var filteredEvents: [Event] {       //Computes the list of events to display, filtered by the search text.
        if searchText.isEmpty {     //If no search text, show all events.
            return sampleEvents
        } else {                    //Otherwise, filter events whose title contains the search text
            return sampleEvents.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            List(filteredEvents) { event in     // Each event is a navigation link to its detail view.
                NavigationLink(
                    destination: EventDetailView(
                        event: event, peopleViewModel: PeopleViewModel())
                ) {
                    VStack(alignment: .leading) {               // Event summary display.
                        Text(event.title).font(.headline)
                        Text(
                            event.date.formatted(
                                date: .abbreviated, time: .shortened)
                        ).font(.subheadline)
                        Text(event.location).font(.subheadline).foregroundColor(
                            .gray)
                        Text("Category: \(event.category)").font(.caption)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Nearby Events")
            .searchable(text: $searchText)
        }
    }
}
