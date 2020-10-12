//
//  Ticket.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 11/10/20.
//

import SwiftUI

struct Ticket: Identifiable {
  let id = UUID()
  let name: String
  let image: String
  let eventType: String
  let location: String
}

let tickets: [Ticket] = [
  Ticket(name: "Build HQ Trivia", image: "cryptocurrency-2", eventType: "Online", location: "Virtual Online"),
  Ticket(name: "Yoga and Meditation", image: "a-white-minimalistic-fitness-studio-with-potted-plants-and-yoga-mats", eventType: "Online", location: "Virtual Online"),
  Ticket(name: "Brightlight Music Festival", image: "attractive-female-singer-standing-next-to-microphone-stand", eventType: "Online", location: "Virtual Online"),
  Ticket(name: "Imagine Dragon Concert Festival", image: "event_2", eventType: "Online", location: "Virtual Online")
]

let ticketsOffline: [Ticket] = [
  Ticket(name: "Brightlight Music Festival", image: "attractive-female-singer-standing-next-to-microphone-stand", eventType: "Offline", location: "Senayan City"),
  Ticket(name: "Imagine Dragon Concert Festival", image: "event_2", eventType: "Offline", location: "Senayan City"),
]
