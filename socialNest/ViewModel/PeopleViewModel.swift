//
//  PeopleViewModel.swift
//  socialNest
//
//  Created by Grown Nomad.
//

import Foundation

class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []

    init() {
        loadPeople()
    }

    // Loads both hardcoded and saved (UserDefaults) users
    private func loadPeople() {
        var loadedPeople = [
            Person(
                name: "Laurie", age: 45,
                tags: ["Wellness", "LuxuryTravel", "Mystery"],
                bio:
                    "A retreat host with a serene exterior and a knack for intuitive healing. Laurie believes in the power of stillness, scented oils, and uncovering what lies beneath the surface. Known for curating exclusive experiences — and quietly observing everyone around her.",
                imageName: "laurie",
                connectionIntent:
                    "People who value peace, self-reflection, and can enjoy deep conversations over herbal tea.",
                location: "Byron Bay, Australia (GMT+10)",
                contactNumber: "+61 412 345 678"
            ),

            Person(
                name: "Kate", age: 32,
                tags: ["ArtCollector", "Wanderlust", "WineTasting"],
                bio:
                    "A jet-setter with a love for rare art, obscure vineyards, and Instagram-perfect views. Kate is fiercely independent, emotionally guarded, and always in control — unless you manage to crack her armor with charm and wit.",
                imageName: "kate",
                connectionIntent:
                    "World-travelers who can keep up with my pace and pour a good glass of Syrah.",
                location: "Barcelona, Spain (GMT+2)",
                contactNumber: "+34 612 889 110"

            ),

            Person(
                name: "Jaclyn", age: 29,
                tags: ["Fashion", "Gossip", "Schemes"],
                bio:
                    "Stylish, sharp-tongued, and always in the middle of some delicious drama. Jaclyn thrives in high-stakes social circles where alliances shift over cocktails. She’s here for the outfits — and maybe a little sabotage.",
                imageName: "jaclyn",
                connectionIntent:
                    "People with good taste and a better secret — drama’s more fun with friends.",
                location: "Byron Bay, Australia (GMT+10)",
                contactNumber: "+61 412 345 678"
            ),

            Person(
                name: "Chloe", age: 24,
                tags: ["Astrology", "Yoga", "Manifesting"],
                bio:
                    "Sweet and spiritual, Chloe believes the universe has a plan — and she’s following every cosmic sign. She journals every morning, does sunrise yoga, and is always up for a deep convo about your moon sign.",
                imageName: "chloe",
                connectionIntent:
                    "People who vibe high, love moon phases, and won’t judge my crystal collection.",
                location: "Barcelona, Spain (GMT+2)",
                contactNumber: "+34 612 889 110"
            ),

            Person(
                name: "Gary", age: 51,
                tags: ["FinanceBro", "Whiskey", "Control"],
                bio:
                    "A powerful exec on ‘vacation,’ Gary can’t help but bring his workaholic mindset everywhere. He hides vulnerability behind sarcasm and bourbon, and struggles to connect without his spreadsheet open.",
                imageName: "gary",
                connectionIntent:
                    "Someone who understands work-life imbalance and can challenge me without a PowerPoint.",
                location: "New York City, USA (GMT-4)",
                contactNumber: "+1 (917) 555-0144"
            ),

            Person(
                name: "Belinda", age: 38,
                tags: ["Healing", "Listening", "SelfGrowth"],
                bio:
                    "An underappreciated yet emotionally intelligent soul, Belinda is the friend you didn’t know you needed. She offers quiet wisdom, soothing energy, and deep empathy — even when her own needs go unheard.",
                imageName: "belinda",
                connectionIntent:
                    "Genuine, grounded people who value real connection — not just conversation.",
                location: "New York City, USA (GMT-4)",
                contactNumber: "+1 (917) 555-0144"

            ),
        ]

        if let data = UserDefaults.standard.data(forKey: "savedPeople"),
            let savedPeople = try? JSONDecoder().decode(
                [Person].self, from: data)
        {
            for person in savedPeople {
                if !loadedPeople.contains(where: {
                    $0.name == person.name
                        && $0.contactNumber == person.contactNumber
                }) {
                    loadedPeople.append(person)
                }
            }
        }

        self.people = loadedPeople
    }

    // Call this after a new signup to persist users
    func savePeople() {
        if let data = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(data, forKey: "savedPeople")
        }
    }

    // Call this after signup
    func addPerson(_ person: Person) {
        people.append(person)
        savePeople()
    }
}
