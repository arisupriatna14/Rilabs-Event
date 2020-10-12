//
//  TicketView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct TicketView: View {
  #if APPCLIP
  let dataTickets: [Ticket] = ticketsOffline
  #else
  let dataTickets: [Ticket] = tickets
  #endif
  
  var body: some View {
    List(dataTickets) { item in
      NavigationLink(destination: TicketDetailView(ticket: item)) {
        TicketItem(ticket: item)
          .padding(.vertical)
      }
    }
    .navigationTitle("Tickets")
  }
}

struct TicketView_Previews: PreviewProvider {
  static var previews: some View {
    TicketView()
  }
}
