import SwiftUI

struct EventListView: View {
    @State private var searchText = ""

    var filteredEvents: [Event] {
        if searchText.isEmpty {
            return sampleEvents
        } else {
            return sampleEvents.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            List(filteredEvents) { event in
                NavigationLink(destination: EventDetailView(event: event, peopleViewModel: PeopleViewModel())) {
                    VStack(alignment: .leading) {
                        Text(event.title).font(.headline)
                        Text(event.date.formatted(date: .abbreviated, time: .shortened)).font(.subheadline)
                        Text(event.location).font(.subheadline).foregroundColor(.gray)
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
