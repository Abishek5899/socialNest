//
//  PeopleViewModel.swift
//  socialNest
//
//  Created by Grown Nomad on 10/5/2025.
//

import Foundation
class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []

    init() {
        loadSampleData()
    }

    private func loadSampleData() {
        people = [
            Person(name: "Laurie", age: 45, tags: ["Wellness", "LuxuryTravel", "Mystery"],
                   bio: "A retreat host with a serene exterior and a knack for intuitive healing. Laurie believes in the power of stillness, scented oils, and uncovering what lies beneath the surface. Known for curating exclusive experiences — and quietly observing everyone around her.",
                   imageName: "laurie"),
            
            Person(name: "Kate", age: 32, tags: ["ArtCollector", "Wanderlust", "WineTasting"],
                   bio: "A jet-setter with a love for rare art, obscure vineyards, and Instagram-perfect views. Kate is fiercely independent, emotionally guarded, and always in control — unless you manage to crack her armor with charm and wit.",
                   imageName: "kate"),

            Person(name: "Jaclyn", age: 29, tags: ["Fashion", "Gossip", "Schemes"],
                   bio: "Stylish, sharp-tongued, and always in the middle of some delicious drama. Jaclyn thrives in high-stakes social circles where alliances shift over cocktails. She’s here for the outfits — and maybe a little sabotage.",
                   imageName: "jaclyn"),

            Person(name: "Chloe", age: 24, tags: ["Astrology", "Yoga", "Manifesting"],
                   bio: "Sweet and spiritual, Chloe believes the universe has a plan — and she’s following every cosmic sign. She journals every morning, does sunrise yoga, and is always up for a deep convo about your moon sign.",
                   imageName: "chloe"),

            Person(name: "Gary", age: 51, tags: ["FinanceBro", "Whiskey", "Control"],
                   bio: "A powerful exec on ‘vacation,’ Gary can’t help but bring his workaholic mindset everywhere. He hides vulnerability behind sarcasm and bourbon, and struggles to connect without his spreadsheet open.",
                   imageName: "gary"),

            Person(name: "Belinda", age: 38, tags: ["Healing", "Listening", "SelfGrowth"],
                   bio: "An underappreciated yet emotionally intelligent soul, Belinda is the friend you didn’t know you needed. She offers quiet wisdom, soothing energy, and deep empathy — even when her own needs go unheard.",
                   imageName: "belinda")
        ]

    }
}
