//
//  Event.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct Event: Identifiable {
  let id = UUID()
  let name: String
  let price: String
  let image: String
  let eventType: String
  let location: String
}

let dataEvent: [Event] = [
  Event(name: "Imagine Dragon Concert Festival", price: "$30", image: "event_2", eventType: "Online", location: "Virtual Online"),
  Event(name: "Brightlight Music Festival", price: "$20", image: "attractive-female-singer-standing-next-to-microphone-stand", eventType: "Online", location: "Virtual Online"),
  Event(name: "Yoga and Meditation", price: "$20", image: "a-white-minimalistic-fitness-studio-with-potted-plants-and-yoga-mats", eventType: "Online", location: "Virtual Online"),
  Event(name: "Brightlight Music Festival 3", price: "$40", image: "black-stage-in-spotlights", eventType: "Online", location: "Virtual Online"),
]

let localEventsOnline: [Event] = [
  Event(name: "Brightlight Music Festival", price: "$20", image: "ai-intelligence", eventType: "Online", location: "Virtual Online"),
  Event(name: "Build HQ Trivia", price: "$20", image: "cryptocurrency-2", eventType: "Online", location: "Virtual Online"),
  Event(name: "UI Design for Developers", price: "$20", image: "designing-2", eventType: "Online", location: "Virtual Online"),
  Event(name: "UI Design using Figma", price: "$20", image: "designing-in-figma", eventType: "Online", location: "Virtual Online"),
  Event(name: "How to start using React Native?", price: "$20", image: "react-native", eventType: "Online", location: "Virtual Online"),
  Event(name: "Brightlight Music Festival", price: "$20", image: "local_event_1", eventType: "Online", location: "Virtual Online"),
]

let localEventsOffline: [Event] = [
  Event(name: "Brightlight Music Festival", price: "$40", image: "attractive-female-singer-standing-next-to-microphone-stand", eventType: "Offline", location: "Senayan City"),
  Event(name: "Imagine Dragon Concert Festival", price: "$50", image: "event_2", eventType: "Offline", location: "Senayan City"),
  Event(name: "Yoga and Meditation", price: "$40", image: "a-white-minimalistic-fitness-studio-with-potted-plants-and-yoga-mats", eventType: "Offline", location: "Pondok Indah Mall"),
  Event(name: "UI Design using Figma", price: "$50", image: "designing-in-figma", eventType: "Offline", location: "Balai Kartini"),
  Event(name: "How to start using React Native?", price: "$40", image: "react-native", eventType: "Offline", location: "Balai Kartini"),
  Event(name: "How to use cryptocurrency?", price: "$50", image: "cryptocurrency-2", eventType: "Offline", location: "Balai Kartini"),
]

let upcomingEvents: [Event] = [
  Event(name: "Official HIGE DANdism Concert", price: "$50", image: "event_4", eventType: "Online", location: "Virtual Online"),
  Event(name: "Painting Glow in the Dark", price: "$30", image: "pensive-handsome-male-artist-holding-brush", eventType: "Online", location: "Virtual Online")
]
