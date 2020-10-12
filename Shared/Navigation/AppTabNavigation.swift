//
//  AppTabNavigation.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct AppTabNavigation: View {
  @State private var selection: Tab = .event
  
  var body: some View {
    TabView(selection: $selection) {
      NavigationView {
        EventView()
      }
      .tabItem {
        Label("Event", systemImage: "music.note.house")
          .accessibility(label: Text("Event"))
      }
      .tag(Tab.event)
      
      NavigationView {
        TicketView()
      }
      .tabItem {
        Label("Ticket", systemImage: "ticket")
          .accessibility(label: Text("Ticket"))
      }
      .tag(Tab.ticket)
      
      NavigationView {
        ProfileView()
      }
      .tabItem {
        Label("Account", systemImage: "person.crop.circle")
          .accessibility(label: Text("Account"))
      }
      .tag(Tab.account)
    }
  }
}

extension AppTabNavigation {
  enum Tab {
    case event
    case ticket
    case account
  }
}

struct AppTabNavigation_Previews: PreviewProvider {
  static var previews: some View {
    AppTabNavigation()
  }
}
