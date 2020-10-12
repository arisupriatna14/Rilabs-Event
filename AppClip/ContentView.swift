//
//  ContentView.swift
//  AppClip
//
//  Created by Ari Supriatna on 12/10/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      NavigationView {
        EventView()
      }
      .tabItem {
        Label("Event", systemImage: "music.note.house")
          .accessibility(label: Text("Event"))
      }
      
      NavigationView {
        TicketView()
      }
      .tabItem {
        Label("Ticket", systemImage: "ticket")
          .accessibility(label: Text("Ticket"))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
